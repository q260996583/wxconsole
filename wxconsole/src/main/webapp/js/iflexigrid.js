/*
 * Flexigrid for jQuery - New Wave Grid
 *
 * Copyright (c) 2008 Paulo P. Marinas (webplicity.net/flexigrid)
 * Dual licensed under the MIT (MIT-LICENSE.txt)
 * and GPL (GPL-LICENSE.txt) licenses.
 *
 * $Date: 2008-07-14 00:09:43 +0800 (Tue, 14 Jul 2008) $
 */

(function($) {

	$.addFlex = function(t, p) {

		if (t.grid)
			return false; // return if already exist
		// apply default properties
		p = $.extend({
			height : 200, // default height
			width : 'auto', // auto width
			striped : false, // apply odd even stripes
			novstripe : false,
			minwidth : 30, // min width of columns
			minheight : 200, // min height of columns
			resizable : false, // resizable table
			url : false, // ajax url
			method : 'POST', // data sending method
			dataType : 'json', // type of data loaded
			errormsg : '连接错误',
			usepager : false, //
			nowrap : true, //				
			start : 0,
			sort : "",
			page : 1, // current page
			total : 0, // total pages
			useRp : true, // use the results per page select box
			limit : 20, // results per page
			limitOptions : [20, 40, 60, 80, 100],
			title : false,
			pagestat : '显示 {from} 至 {to} 条记录  共{total}条',
			procmsg : '加载中，请稍候...',
			nomsg : '未找到记录',
			pagesize : '&nbsp;每页&nbsp;',
			minColToggle : 1, // minimum allowed column to be hidden
			showToggleBtn : true, // show or hide column toggle popup
			hideOnSubmit : true,
			clickRecord:null,
			autoload : true,
			checkbox : false, // 是否选择多选框
			blockOpacity : 0.5,
			onToggleCol : false,
			onChangeSort : false,
			dbClickRecord : false,
			onSuccess : false,
			ajaxSuccess : false,
			ajaxFail : false,
			onSubmit : false,// using a custom populate function,
			root : 'root',
			singleSelect : true,
			totalProperty : 'totalProperty',
			dataRecord : '',
			dataStore : [],
			colModel : [],
			viewStore : [],
			jsonfilter : [],
			enableLoadFirst : false,
			// some delete items
			index : ''
		}, p);

		$(t).show() // show if hidden
		.attr({
			cellPadding : 0,
			cellSpacing : 0,
			border : 0
		}) // remove padding and spacing
		.removeAttr('width') // remove width properties
		;

		var g = {
			// copy
			objClone : function(obj) {
				var result = new Object();
				for ( var i in obj)
					result[i] = obj[i];
				return result;
			},
			// 存储数据
			dataStore : function(data) {
				p.index = null;
				p.dataRecord = null;
				p.dataStore = [];
				p.viewStore = [];
				$(data[p.root]).each(function(i) {
					var datax = data[p.root][i];
					p.dataStore.push(g.objClone(datax));
					p.viewStore.push(g.objClone(datax));
				});
			},

			buildpager : function() { // rebuild pager based on new properties
				$('.pcontrol input', this.pDiv).val(p.page);
				$('.pcontrol span', this.pDiv).html(p.pages);
				var r1 = (p.page - 1) * p.limit + 1;
				var r2 = r1 + p.limit - 1;

				if (p.total < r2)
					r2 = p.total;

				var stat = p.pagestat;

				stat = stat.replace(/{from}/, r1);
				stat = stat.replace(/{to}/, r2);
				stat = stat.replace(/{total}/, p.total);
				$('.pPageStat', this.pDiv).html(stat);

			},

			// --
			addRowProp : function() {
				$('tbody tr', g.table).each(function(index) {
					$(this).click(function(e) {
						$(this).toggleClass('trSelected');

						var obj = (e.target || e.srcElement);
						if (obj.href || obj.type) {
							if ($(this).hasClass('trSelected')) {
								p.index = index;
								p.dataRecord = p.dataStore[index];
							} else {
								p.index = null;
								p.dataRecord = null;
							}
							return true;
						}

						if ($(this).hasClass('trSelected')) {
						
							p.index = index;
							p.dataRecord = p.dataStore[index];
							if(p.clickRecord){								
								p.clickRecord.apply(t,[p.dataRecord,p.index]);
							}
						} else {
							p.index = null;
							p.dataRecord = null;
						}
						if (p.checkbox) {
							check = $(this).find('input')[0];
							check.checked = !check.checked;
						}
						if (!p.checkbox)
						$(this).siblings().removeClass('trSelected');
						
						
					}).hover(function(){$(this).addClass("hover");},
							function(){$(this).removeClass("hover");}
					).dblclick(
							function (e){
								if(p.dbClickRecord){
									p.dbClickRecord(p.dataStore[index],index);
								}
							}	
						);
				});

			},

			changePage : function(ctype) { // change page
				if (this.loading)
					return true;
				switch (ctype) {
				case 'first':
					p.start = 0;
					p.newp = 1;
					break;
				case 'prev':
					if (p.page > 1) {
						p.start = p.start - p.limit;
						p.newp = parseInt(p.page) - 1;
					}
					break;
				case 'next':
					if (p.page < p.pages) {
						p.start = p.start + p.limit;
						p.newp = parseInt(p.page) + 1;
					}
					break;
				case 'last': {
					p.start = (p.pages - 1) * p.limit;
					p.newp = p.pages;
				}
					break;
				case 'input':
					var nv = parseInt($('.pcontrol input', this.pDiv).val());
					if (isNaN(nv))
						nv = 1;
					if (nv < 1)
						nv = 1;
					else if (nv > p.pages)
						nv = p.pages;
					$('.pcontrol input', this.pDiv).val(nv);
					p.newp = nv;
					p.start = (nv - 1) * p.limit;
					break;
				}
				if (p.newp == p.page)
					return false;

				if (p.onChangePage)
					p.onChangePage(p.newp);
				else
					this.populate();

			},
			// 刷新表格
			populate : function() {
				if (!p.enableLoadFirst)
					return false;
				if (this.loading)
					return true;
				if (!p.url)
					return false;
				this.loading = true;
				$('.pPageStat', this.pDiv).html(p.procmsg);
				$('.pReload', this.pDiv).addClass('loading');
				if (!p.newp)
					p.newp = 1;
				var param = [ {
					name : 'start',
					value : p.start
				}, {
					name : 'limit',
					value : p.limit
				}, {
					name : 'sort',
					value : p.sort
				}, {
					name : 'dir',
					value : p.dir
				}, {
					name : 'jsonfilter',
					value : p.jsonfilter
				} ];

				if (p.params) {
					for ( var pi = 0; pi < p.params.length; pi++)
						param[param.length] = p.params[pi];
				}
				if (p.ajaxStart)
					p.ajaxStart();
				
				$.ajax({
					type : p.method,
					url : p.url,
					data : param,
					dataType : p.dataType,
					success : function(data) {
						g.dataStore(data);
						g.addData(data);
					},
					error : function(data) {
						try {
							
							$('.pReload', this.pDiv).removeClass('loading');
							g.loading = false;							
							$('.pPageStat', this.pDiv).html(p.errormsg);						
							if (p.ajaxFail)
								p.ajaxFail(data);
						} catch (e) {
						}
					}
				});

			},

			changeSort : function(th) { // change sortorder

				if (this.loading)
					return true;

				if (p.dir == 'asc')
					p.dir = 'desc';
				else
					p.dir = 'asc';

				$(th).addClass('sorted').siblings().removeClass('sorted');
				$('.sdesc', g.table.head).removeClass('sdesc');
				$('.sasc', g.table.head).removeClass('sasc');
				$(th).addClass('s' + p.dir);
				p.sort = $(th).attr('sortField');
				this.populate();
			},
			
			 //single data operation
			 sigleDataStore:function(record){
				$(p.colModel).each(function(i){
					if(p.colModel[i].renderer){
						$('thead tr:first th',g.hDiv).each
						(
							function (){
								var renderer_col_name = $(this).attr('abbr');
								if(p.colModel[i].dataIndex == renderer_col_name){
									record[renderer_col_name] = p.colModel[i].renderer(record);
								}
							}
						);
					
					}
				});
				  return record;
			 },
			 

			// 刷新数据
			addData : function(data) {
				// ///-------

				$('.pReload', this.pDiv).removeClass('loading');
				this.loading = false;
				if (!data) {
					$('.pPageStat', this.pDiv).html(p.errormsg);
					return false;
				}

				p.total = data[p.totalProperty];
				$(this.table.body).empty();
				if (p.total == 0) {
					//$('tr, a, td, div', this.table).unbind();
					p.pages = 1;
					p.page = 1;
					this.buildpager();
					$('.pPageStat', this.pDiv).html(p.nomsg);
					return false;
				}

				p.pages = Math.ceil(p.total / p.limit);
				p.page = Math.floor(p.start / p.limit) + 1;
				this.buildpager();
				$.each(p.viewStore, function(i, row) {
					var tr = document.createElement('tr');
					if(p.striped){
						if (i % 2)
							tr.className = 'erow';
					}
					
					if (row)
						tr.id = 'row' + i;
					// add cell
					// $('tr:first th:visible',g.table.head).each
					if (p.checkbox) {
						var td = document.createElement('td');
						td.align = "center";
						if(row.check){
							td.innerHTML = "<input type='checkbox' checked='checked'/>";
							$(tr).addClass('trSelected');
						}
						else 
						td.innerHTML = "<input type='checkbox'/>";
						$(tr).append(td);
						
						
					}

				
					$('tr:first th[hide!=true]', g.table.head).each(
							function(i) {
								var td = document.createElement('td');
								var idx = $(this).attr('axis').substr(3);
								var col_name = $(this).attr('abbr');
								var colvalue = row[col_name];
								
								td.align = this.innerAlign||"center";
								td.width = this.width;
								if (this.render)
									td.innerHTML = this.render(row, colvalue,tr);
								else if (this.decode) {
									if (this.decode[colvalue])
										td.innerHTML = this.decode[colvalue];
									else
										td.innerHTML = this.decode.noMatch;
								}
								else if (colvalue)
									td.innerHTML = row[col_name];
								else
									td.innerHTML = "";
								td.title=td.innerHTML;
								$(tr).append(td);
								td = null;
							});
					
					g.table.body.append($(tr));
				});
				g.addRowProp();

			}
		};
		g.tdiv = $('<div></div>').css('overflow','auto');
		g.table = $('<table border="1"></table>').addClass('itable');
		g.table.head = $('<thead/>').addClass('ihead');
		g.table.body = $('<tbody/>').addClass('ibody');
		g.table.foot = $('<tfoot/>').addClass('ifoot');
		g.nBtn = $('<div/>').addClass('ibutton'); // create column show/hide
		g.tdiv.append(g.table);								// button
		g.pDiv = $('<div/>').addClass('pDiv');
		g.table.append(g.table.head);
		g.table.append(g.table.body);
		g.table.append(g.table.foot);
		$(t).append(g.tdiv);
		$(t).attr('width', p.width);
		if (p.usepager) {
			$(t).append(g.pDiv);
		}

		// 画表头
		if (p.colModel) {
			tr = document.createElement('tr');

			for (i = 0; i < p.colModel.length; i++) {
				var cm = p.colModel[i];
				var th = document.createElement('th');
				th.innerHTML = cm.display;

				if (cm.dataIndex){
					$(th).attr('abbr', cm.dataIndex);
					$(th).attr('sortField', cm.dataIndex);
				}
				if(cm.sortField)
					$(th).attr('sortField', cm.sortField);
			
				$(th).attr('axis', 'col' + i);

				if (cm.align)
				th.innerAlign = cm.align;
				th.align="center";
				if (cm.decode)
					th.decode = cm.decode;

				if (cm.render)
					th.render = cm.render;

				if (cm.sortable) {
					$(th).click(function(e) {
						var obj = (e.target || e.srcElement);
						if (obj.href || obj.type)
							return true;
						g.changeSort(this);
					}).toggleClass("thOver");
				}

				if (cm.width)
					$(th).attr('width', cm.width);

				if (cm.hide) {
					th.hide = true;
					$(th).hide();
				}
				$(tr).append(th);
			}
			$(g.table.head).append(tr);
		} // end if p.colmodel

		// 添加多选框
		if (p.checkbox) {
			$('tr', g.table.head)
					.each(
							function() {

								var cth = $('<td align="center"/>');

								var cthch = $('<input type="checkbox"/>');

								cthch
										.click(function() {
											if (this.checked) {
												$('tr', g.table.body)
														.each(
																function() {
																	if ($(this)
																			.attr(
																					'disabled'))
																		return;
																	$(this)
																			.addClass(
																					'trSelected')
																			.find(
																					'input')[0].checked = true;
																});
											} else {
												$('tr', g.table.body)
														.each(
																function() {
																	if ($(this)
																			.attr(
																					'disabled'))
																		return;
																	$(this)
																			.removeClass(
																					'trSelected')
																			.find(
																					'input')[0].checked = false;
																});
											}
										});

								cth.addClass("cth").attr({
									width : "22"
								}).append(cthch);

								$(this).prepend(cth);

							});
		}
		;

		// ----------

		// 是否有分页信息
		if (p.usepager) {
			g.pDiv.addClass('pDiv');
			g.pDiv.html('<div class="pDiv2"></div>');
			var html = ' <div class="pGroup"> <div class="pFirst pButton"><span></span></div><div class="pPrev pButton"><span></span></div> </div> <div class="btnseparator"></div> <div class="pGroup"><span class="pcontrol">第 <input id="pageNum" type="text" size="4" value="1" /> 页 共<span>1</span>页 </span></div> <div class="btnseparator"></div> <div class="pGroup"> <div class="pNext pButton"><span></span></div><div class="pLast pButton"><span></span></div> </div> <div class="btnseparator"></div> <div class="pGroup"> <div class="pReload pButton"><span></span></div> </div> <div class="btnseparator"></div> <div class="pGroup"><span class="pPageStat"></span></div>';

			$('div', g.pDiv).html(html);
			$('#pageNum', g.pDiv).change(function() {
				if (p.onRpChange)
					p.onRpChange(+this.value);
				else {
					var num = parseInt($(this).val());
					if (num <= p.pages && num >= 1) {
						p.start = (num - 1) * p.limit;
						p.newp = num;
						g.populate();
					}
				}
			});
			$('.pReload', g.pDiv).click(function() {
				g.populate();
			});
			$('.pFirst', g.pDiv).click(function() {
				g.changePage('first');
			});
			$('.pPrev', g.pDiv).click(function() {
				g.changePage('prev');
			});
			$('.pNext', g.pDiv).click(function() {
				g.changePage('next');
			});
			$('.pLast', g.pDiv).click(function() {
				g.changePage('last');
			});
			$('.pcontrol input', g.pDiv).keydown(function(e) {
				if (e.keyCode == 13)
					g.changePage('input');
			});
			if ($.browser.msie && $.browser.version < 7)
				$('.pButton', g.pDiv).hover(function() {
					$(this).addClass('pBtnOver');
				}, function() {
					$(this).removeClass('pBtnOver');
				});

			if (p.useRp) {
				var opt = "";
				for ( var nx = 0; nx < p.limitOptions.length; nx++) {
					if (p.limit == p.limitOptions[nx])
						sel = 'selected="selected"';
					else
						sel = '';
					opt += "<option value='" + p.limitOptions[nx] + "' " + sel
							+ " >" + p.limitOptions[nx]
							+ "&nbsp;&nbsp;</option>";
				}
				;
				$('.pDiv2', g.pDiv)
						.prepend(
								"<div class='pGroup'>"
										+ p.pagesize
										+ "<select name='rp'>"
										+ opt
										+ "</select></div> <div class='btnseparator'></div>");
				$('select', g.pDiv).change(function() {
					if (p.onRpChange)
						p.onRpChange(+this.value);
					else {
						p.newp = 1;
						p.start = 0;
						p.limit = +this.value;
						g.populate();
					}
				});
			}
		}

		// 是否有按钮
		if (p.buttons) {
			var tDiv2 = document.createElement('div');
			tDiv2.className = 'tDiv2';

			for (i = 0; i < p.buttons.length; i++) {
				var btn = p.buttons[i];
				if(btn.show){
					var count=$.inArray(btn.show, parent.buttonAutors);						
					if(count==-1){
						continue;
					}
				}				
				if (!btn.separator) {
					var btnDiv = document.createElement('div');
					btnDiv.className = 'fbutton';
					btnDiv.innerHTML = "<div><span>" + btn.name
							+ "</span></div>";
					if (btn.bclass)
						$('span', btnDiv).addClass(btn.bclass).css({
							paddingLeft : 20
						});
					btnDiv.onpress = btn.onpress;
					btnDiv.name = btn.name;
					btnDiv.id = btn.id;
					if (btn.onpress) {
						$(btnDiv).click(function() {
							if($(this).hasClass('idisablebutton')){
								return;
							}
							else this.onpress.apply(t, [ p.dataRecord, this.id ]);
						});
					}
					$(tDiv2).append(btnDiv);
					if ($.browser.msie && $.browser.version < 7.0) {
						$(btnDiv).hover(function() {
							$(this).addClass('fbOver');
						}, function() {
							$(this).removeClass('fbOver');
						});
					}
				} else {
					$(tDiv2).append("<div class='btnseparator'></div>");
				}
			}
			g.nBtn.append(tDiv2);
			g.nBtn.append("<div style='clear:both'></div>");

			$(t).prepend(g.nBtn);
		}

		$(t).addClass('flexigrid');

		t.p = p;
		t.grid = g;
		return t;
	};

	$.fn.flexReload = function(data,params) { // function to reload grid
		if (!data)
			return;
		return this.each(function() {
			if (!this.p)
				return;
			this.p.jsonfilter = new Array();
			this.p.jsonfilter.push($.toJSON(data));
			this.p.start = 0;
			this.p.params=params;
			if (this.grid && this.p.url) {
				this.p.enableLoadFirst = true;
				this.grid.populate();
			}
		});

	}; // end flexReload
	

	$.fn.flexAllSelectData = function() {
		var data = new Array();
		this.each(function() {
			if (this.grid) {
				dataStore = this.p.dataStore;
				$(this).find('.trSelected').each(function() {
					index = $(this).attr('id').substr(3);
					data.push(dataStore[index]);
				});
			}
		});
		return data;
	};
	
	
	$.fn.flexAllData = function() {	
		var grid =this.get(0);		
			if (grid.grid) {
				return grid.p.dataStore;				
			}	
	};
	$.fn.refresh = function() {
		this.each(function() {
			if (this.grid) {
				if (this.p.jsonfilter == '')
					return;
				this.grid.populate();
			}
		});

	};
	
	$.fn.refreshWithData = function(data) {
		this.each(function() {
			if (this.grid) {
				this.grid.dataStore(data);
				this.grid.addData(data);			
			}
		});

	};
	
	$.fn.flexAddData = function(data) { // function to add data to grid

		/*return this.each( function() {
				if (this.grid) this.grid.addData(data);
			});*/
		return this.each( function() {
			if (this.grid) {
				this.p.dataStore.unshift(data);
				var newRecord = this.grid.sigleDataStore(data);
				this.p.viewStore.unshift(newRecord);			
			   var 	obj=new Object();
				obj[this.p.totalProperty]=this.p.viewStore.length;
				obj.root=this.p.viewStore;
				this.grid.addData(obj);
			};
		});

	};
	$.fn.flexModifyData = function(data) { // function to modify data to grid
		return this.each( function() {
			if (this.grid) {			 
				var record_index = this.p.index;
				if(record_index!=null){				
					this.p.dataStore.splice(record_index,1,data);
					this.p.viewStore.splice(record_index,1,data);
					obj=new Object();
 				    obj[this.p.totalProperty]=this.p.total;
					obj.root=this.p.viewStore;
					this.grid.addData(obj);
				}
			};
		});

	};
	
	$.fn.flexRemoveData = function(data) { // function to modify data to grid
		return this.each( function() {
			if (this.grid ) {			 
				var record_index = this.p.index;
				if(record_index!=null){				
					this.p.dataStore.splice(record_index,1);
					this.p.viewStore.splice(record_index,1);
					obj=new Object();
 				    obj[this.p.totalProperty]=this.p.total;
					obj.root=this.p.viewStore;
					this.grid.addData(obj);
				}
			};
		});
	};
	
	$.fn.flexDisableButton = function(data) { // function to modify data to grid
		  var div= $('#'+data.id);
		div.addClass('idisablebutton');
		 div.css('color','gray');
		 return;

	};
	$.fn.flexEnableButton = function(data) { // function to modify data to grid
			var div= $('#'+data.id);
			div.removeClass('idisablebutton');
			div.css('color','black');		
		  return;
	
	};
	
	$.fn.flexFile = function(url) { 
		 this.each( function() {
			if (this.grid) {
				if(this.p.jsonfilter=='')
				return;				
			var param = [{ name : 'jsonfilter', value : this.p.jsonfilter}];	
				var str = jQuery.param(param);
				if(url.indexOf("?")>0){
					window.open(url+"&"+str);
				}
				else window.open(url+"?"+str);				
			};
		});

	};
	

	$.fn.flexigrid = function(p) {

		return this.each(function() {
			$.addFlex(this, p);
		});
	};

})(jQuery);