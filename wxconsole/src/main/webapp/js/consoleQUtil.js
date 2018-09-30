(function($){
	$.fn.extend({          
           "pickdate"	:function(op){
          			var a=$.extend({
			    	oncleared:function(){$(this).blur();},
			    	onpicked:function(){$(this).blur();}			
					},op);
				$(this).click(function(){
			     	WdatePicker(a);
				})
				return this;
				}
	         ,
	         "jsonObject":function(){
	        	 var obj=new Object();
	        		$(this).find(':input').not(':button').each(function(i,n){	        	   		
	        	   		if($(this).val()){
	        	   			if(this.type=="radio"){
	        	   	   			if(this.checked){
	        	   	   				obj[n.name]=$(this).val();
	        	   	   			}
	        	   	   		}
	        	   	   		else obj[n.name]=$(this).val();
	        	   		}	        	   			    		
	        	   	});
	        		return obj;
	         },
formToJSON: function() {
	var obj=new Object();
	$(this).find(':input').not(':button').each(function(i,n){	        	   		
   		if($(this).val()){
   			if(this.type=="radio"){
   	   			if(this.checked){
   	   				if ( n.name && n.name != '') {
   	   					obj[n.name]=$(this).val();
   	   					$.inputToObj(obj, n);
   	   				}
   	   			}
   	   		} else {
   	   			if ( n.name && n.name != '') $.inputToObj(obj, n);;
   	   		}
   		}	        	   			    		
   	});
	return obj; 
},
	         "queryTable":function(setting){	        	 
	        	  var p=$.extend({filter:[]},setting);	      		
	      		  var qdiv=$(this);
	      		$('.qbutton',qdiv).click(function(){     			
	      			var able=true;
	      			
	      			$('.qNotEmpty',qdiv).each(function(){
	      			    if(!$(this).val())	{	      			    	
	      			         alert($(this).parent().prev().text()+"条件不能为空");
	      			         able=false;
	      			       $(this).focus();
	      			       return false;   
	      			    }
	      			});	      			
	      			if(!able){
	      				return;
	      			}	      			
	      			var filter=new Array();
	      		  	$(':input[comparison]',qdiv).each(function(){   
	      		    	var theType=(typeof $(this).val());
	      		        if(theType!="object"){
	          		    	if($(this).val()){
	          				filter.push({"field":this.name,"data":{"type":"string","value":$(this).val(),"comparison":$(this).attr("comparison")}});
	          			}
	      		  }	          		
	          	})	          
	          	$.each(p.filter,function(i,n){
	          		var v=n.value();
	          		if(v)
	          		filter.push({"field":n.field,"data":{"type":n.type,"value":v,"comparison":n.comparison}});
	          	});
	      		  var params=new Array();
				    $(':input.param',qdiv).each(function(){
				    	params.push({name:this.name,value:$(this).val()});
				    });	
	      		  	
	      		  	
	             	$('#'+p.tableId).flexReload(filter,params); 	      		
	      		});
	      		
	       },
	         
	         "fillObject":function(setting){
	        	 var p=$.extend({clear:true,obj:null},setting);
	        	 if(p.clear){
	        		 $(this).find(':input[type!=radio][type!=button]').not(':checkbox').not('.notFill').val('');
	        	 }
	        	 if(!p.obj)
	             return;
	        	 $(this).find(':input,span[name]').not(':checkbox').each(function(){
	        		//alert(this.name);
	        		var name=$(this).attr('name');
	        		var xtype = $(this).attr('xtype');
	        		if(name in p.obj){        				 
	        			if(this.type=='radio'){
	        				if(this.value==p.obj[name]) this.checked='checked';	        				  
	        			} else  {	        				  
	        				if(this.tagName=="SPAN"){ 
	        					this.innerHTML=p.obj[name]; 
	        				} else {
	        					this.value=p.obj[name];
	      			    	  	switch ( xtype ) {
	      						case 'money': 
	      							this.value = frmMoney(p.obj[name]); break;
	      						case 'rate':
	      							this.value = frmRate(p.obj[name]); break;
	      						case 'rate3':
	      							this.value = frmRate3(p.obj[name]); break;
	      						case 'rate4':
	      							this.value = frmRate4(p.obj[name]); break;
	      						case 'date':
	      							var cid = $(this).attr('id');
	      							$('#'+cid+'-disp').val(frmBSDate(p.obj[name]));
	      							break;
	      						case 'datetime':
	      							if (console) { console.log(p.obj[name]); }
	      							var cid = $(this).attr('id');
	      							$('#'+cid+'-disp').val(frmBSTime(p.obj[name]));
	      							break;
	      						default : break;
	      			    	  }
	        				}/*this.value=p.obj[name];*/
	        			}
	        				  
	        				  
	        		 }	        			 
	        	 });
	        	 	        	 
	         },
	         
	         
	         "queryDialogOpen":function(setting){ 
	        	 //if(setting.qWhenOpen)
	        	 $('.qbutton',this).trigger('click');
			    var grid=$('.flexigrid',this);		
				var buttons=new Object();
				buttons["确定"]=function(){
					var data=grid.flexAllSelectData();
					
					if(setting.list){
						if(setting.success(data))
					    $(this).dialog('close');
					}
					else if(data.length>0){
							if(data.length>1){
								if(setting.success(data));
							}else{
								if(setting.success(data[0]));
							}
						 $(this).dialog('close');
						 
					  }					   
					else {
						if(setting.success(null))
							$(this).dialog('close');
					}											
				};
				if(setting.clear){
					buttons["清空"]=function(){if(setting.clear)
					       setting.clear();
				    $(this).dialog('close');
		           }					
				}				
				buttons["取消"]=function(){$(this).dialog('close');}					
	        	 $(this).dialog('option','buttons',buttons);
					$(this).dialog('open');	        
	         },	         
	         "ajaxSelect" : function(op){
         		var $this=this;
         		var setting={
							displayField:'text',
							valueField:'value',
							blank:false,
							async:false,
							isall:false,							
							initData:null,							
							data:null
							};							
			  var p=$.extend({},setting,op);
		      $.ajax({
		      url:p.url,
		      async:p.async,
		      data:p.data,
		      dataType:'json',
		      success:function(data){
		    	  var datas=data.root;	
		    	  $this.each(function(){		    		  	  	
			            var select=$(this);
			            select.empty();			            
		               if(p.blank){
		            	   select.append("<option value='' selected='selected' >不限</option>");
			        	}
		               if(p.initData){
		            	   for(var attr in p.initData){
		            		   select.append("<option value='"+p.initData[attr]+"'>"+attr+"</option>");
		            	   }
		               }
		               if(datas.length==0)
		   	            return;	
		             $.each(datas,function(i,n){
		            	 if(i==0&&select.children('[selected]').length==0)
		            	 select.append("<option selected='selected' value=" + n[p.valueField] + ">" + n[p.displayField] + "</option>");
		            	 else select.append("<option value=" + n[p.valueField] + ">" + n[p.displayField] + "</option>");
		            	 });								
		     });
		}		
		});				
		 return this;
 },
      
        
              "jsTree":function(setting){            	  
            	        	  
            	var  conf = {
            			    data:{
            			        type  : "json",
            			        method:"POST",
            			        json  :null,
            			        url:setting.url            			        
            			    },
            			    ui : {
            			        theme_name : setting.theme_name||"apple"
            			    },            			   
            			    callback : {          
            			       	  beforeclose : function(NODE,TREE_OBJ) { 
            			       	   var $this = $(NODE).is("li") ? $(NODE) : $(NODE).parent();
            			       	    $this.children('span').removeClass().addClass('folderclosed');       	   
            			       	  return true ;
            			       	  },
            			       	  
            			      beforeopen  : function(NODE,TREE_OBJ) { 
            			       	 var $this = $(NODE).is("li") ? $(NODE) : $(NODE).parent();
            			       		$this.children('span').removeClass().addClass('folderopen');       		
            			          	return true ;
            			       	}, 
            			        onchange : function (NODE, TREE_OBJ) {
            			        	if(setting.onchange){
            			        		setting.onchange(NODE, TREE_OBJ);
            			        		return;
            			        	}
            			        	
            			            if(TREE_OBJ.settings.ui.theme_name == "checkbox") {
            			                var $this = $(NODE).is("li") ? $(NODE) : $(NODE).parent();            			          
            			                $this.children("a").removeClass("clicked");
            			                if($this.children("a").hasClass("checked")) {
            			                    $this.find("li").andSelf().children("a").removeClass("checked").removeClass("undetermined").addClass("unchecked");
            			                    var state = 0;
            			                }
            			                else {
            			                    $this.find("li").andSelf().children("a").removeClass("unchecked").removeClass("undetermined").addClass("checked");
                   	
            			                    $this.find('li').andSelf().each(function(){
            			              		TREE_OBJ.open_branch($(this));
            			                })
            			                    var state = 1;
            			                }
            			                $this.parents("li").each(function () { 
            			                    if(state == 1) {
            			                            if($(this).find("a.unchecked, a.undetermined").size() - 1 > 0) {
            			                            $(this).parents("li").andSelf().children("a").removeClass("unchecked").removeClass("checked").addClass("undetermined");
            			                            return false;
            			                        }
            			                        else $(this).children("a").removeClass("unchecked").removeClass("undetermined").addClass("checked");
            			                    }
            			                    else {
            			                        if($(this).find("a.checked, a.undetermined").size() - 1 > 0) {
            			                            $(this).parents("li").andSelf().children("a").removeClass("unchecked").removeClass("checked").addClass("undetermined");
            			                            return false;
            			                        }
            			                        else $(this).children("a").removeClass("checked").removeClass("undetermined").addClass("unchecked");
            			                    }
            			                });
            			                
            			             }
            			        }
            			    }
            			};           	
            	 if(conf.ui.theme_name=="checkbox")
            		 conf.callback.onload=function(treeobj){  
            		 var div= treeobj.container; 
            		 div.find('a').before('<span/>');            			   			
            			   			function setState(p){
            			   				var state="";   			
            			   				p.children('ul').children('li').each(function(){
            			   						var chidrenstate;
            			   						if($(this).hasClass('leaf')){
            				   							if($(this).attr('check')=='true'){
            				   								$(this).children('a').addClass('checked');
            				   								treeobj.open_branch($(this).parents('li'));
            				   								chidrenstate="checked";				
            				   						}
            				   						else {   						
            				   						$(this).children('a').addClass('unchecked');
            				   						chidrenstate="unchecked";		
            				   						}		
            			   						}    																	
            			   						else chidrenstate=setState($(this));   						   					
            			   					    if(state=="undetermined")
            			   						  	return; 
            			   					     if(state=="")
            			   						 	state=chidrenstate;   											 
            			   						 else if(state!=chidrenstate)
            			   						 state="undetermined";			   						
            			   				});
            			   		    $(p).children('a').addClass(state);
            			   			return state;				
            			   		}           			   		
            			   		 setState(div.find('li:first'));  
            			   		 treeobj.open_all();
            			};
            	 else 
            		 conf.callback.onload=function(treeobj){
            		 treeobj.open_all();
            		 };
            	 
            		if($(this).data('tree')){            			
            			var roleTree=$(this).data('tree');
            			 roleTree.destroy();
            			 roleTree.selected=null;	
            			roleTree.init($(this),$.extend({},conf));
            		}		
            		else {
            			var roleTree = $.tree_create();
                		$(this).data('tree',roleTree);
                        roleTree.init($(this),$.extend({},conf));
            		}
            		 
            		 
               
            	  
        },"jsTreeExtend":function(setting){            	  
        	var  conf = {
        			    data:{
        			        type  : "json",
        			        method:"POST",
        			        json  :null,
        			        url:setting.url            			        
        			    },
        			    ui : {
        			        theme_name : setting.theme_name||"apple"
        			    },            			   
        			    callback : {          
        			       	  beforeclose : function(NODE,TREE_OBJ) { 
        			       	   var $this = $(NODE).is("li") ? $(NODE) : $(NODE).parent();
        			       	    $this.children('span').removeClass().addClass('folderclosed');       	   
        			       	  return true ;
        			       	  },
        			       	  
        			      beforeopen  : function(NODE,TREE_OBJ) {
        			       	 var $this = $(NODE).is("li") ? $(NODE) : $(NODE).parent();
        			       		$this.children('span').removeClass().addClass('folderopen');
        			       		if(!$this.hasClass('leaf')){
        			       			if($this.children('img').length==0){
        			       				var $noImg = $('<img style="width:16px;cursor: pointer;" src="images/icon/no_16.png"/>').click(function () {
            				                var $this = $(this).parent();            			          
            				                $this.children("a").removeClass("clicked");
            				                if($this.children("a").hasClass("checked")) {
            				                    $this.find("li").andSelf().children("a").removeClass("checked").removeClass("undetermined").addClass("unchecked");
            				                    var state = 0;
            				                }
            				        });
        			       				var $yesImg = $('<img style="width:16px;cursor: pointer;" src="images/icon/yes_16.png"/>').click(function () {
            				                var $this = $(this).parent();            			          
            				                $this.children("a").removeClass("clicked");
        				                    $this.find("li").andSelf().children("a").removeClass("unchecked").removeClass("undetermined").addClass("checked");
        				                    $this.find('li').andSelf().each(function(){
        				              		//TREE_OBJ.open_branch($(this));
        				                	})
        				                    var state = 1;
            				        });
        			       				$this.children('a').after($noImg);
        			       				$this.children('a').after($yesImg);
        			       			}
        			       		}
        			          	return true ;
        			       	}, 
        			        onchange : function (NODE, TREE_OBJ) {
        			        	if(setting.onchange){
        			        		setting.onchange(NODE, TREE_OBJ);
        			        		return;
        			        	}
        			            if(TREE_OBJ.settings.ui.theme_name == "checkbox") {
        			                var $this = $(NODE).is("li") ? $(NODE) : $(NODE).parent();            			          
        			                $this.children("a").removeClass("clicked");
        			                if($this.children("a").hasClass("checked")) {
        			                	$this.children("a").removeClass("checked").removeClass("undetermined").addClass("unchecked");
        			                    //$this.find("li").andSelf().children("a").removeClass("checked").removeClass("undetermined").addClass("unchecked");
        			                    var state = 0;
        			                }
        			                else {
        			                	$this.children("a").removeClass("unchecked").removeClass("undetermined").addClass("checked");
        			                	TREE_OBJ.open_branch($(this));
        			                    //$this.find("li").andSelf().children("a").removeClass("unchecked").removeClass("undetermined").addClass("checked");
        			                    //$this.find('li').andSelf().each(function(){
        			              		//TREE_OBJ.open_branch($(this));
        			                	//})
        			                    var state = 1;
        			                }
//        			                $this.parents("li").each(function () { 
//        			                    if(state == 1) {
//        			                            if($(this).find("a.unchecked, a.undetermined").size() - 1 > 0) {
//        			                            $(this).parents("li").andSelf().children("a").removeClass("unchecked").removeClass("checked").addClass("undetermined");
//        			                            return false;
//        			                        }
//        			                        else $(this).children("a").removeClass("unchecked").removeClass("undetermined").addClass("checked");
//        			                    }
//        			                    else {
//        			                        if($(this).find("a.checked, a.undetermined").size() - 1 > 0) {
//        			                            $(this).parents("li").andSelf().children("a").removeClass("unchecked").removeClass("checked").addClass("undetermined");
//        			                            return false;
//        			                        }
//        			                        else $(this).children("a").removeClass("checked").removeClass("undetermined").addClass("unchecked");
//        			                    }
//        			                });
        			                
        			             }
        			        }
        			    }
        			};           	
        	 if(conf.ui.theme_name=="checkbox")
        		 conf.callback.onload=function(treeobj){  
        		 var div= treeobj.container; 
        		 div.find('a').before('<span/>');
        		 div.find('li').each(function(i,n){
        			 if($(this).attr('check')=='true'){
							$(this).children('a').addClass('checked');
							if(!$(this).attr('leaf')){
								treeobj.open_branch($(this).parents('li'));
							}
							chidrenstate = "checked";				
						}else{   						
							$(this).children('a').addClass('unchecked');
							chidrenstate = "unchecked";		
						}
        		 });
//        			   			function setState(p){
//        			   				var state="";   			
//        			   				p.children('ul').children('li').each(function(){
//        			   						var chidrenstate;
//				   							if($(this).attr('check')=='true'){
//				   								$(this).children('a').addClass('checked');
//				   								treeobj.open_branch($(this).parents('li'));
//				   								chidrenstate = "checked";				
//    				   						}else{   						
//    				   							$(this).children('a').addClass('unchecked');
//    				   							chidrenstate = "unchecked";		
//    				   						}		
////        			   						else chidrenstate=setState($(this));   						   					
////        			   					    if(state=="undetermined")
////        			   						  	return; 
////        			   					     if(state=="")
////        			   						 	state=chidrenstate;   											 
////        			   						 else if(state!=chidrenstate)
////        			   						 state="undetermined";			   						
//        			   				});
//        			   		    //$(p).children('a').addClass(state);
//        			   			return state;				
//        			   		}           			   		
//        			   		 setState(div.find('li:first'));  
        			   		 treeobj.open_all();
        			};
        	 else 
        		 conf.callback.onload=function(treeobj){
        		 	treeobj.open_all();
        		 };
        		if($(this).data('tree')) {            			
        			var roleTree=$(this).data('tree');
        			 roleTree.destroy();
        			 roleTree.selected=null;	
        			roleTree.init($(this),$.extend({},conf));
        		} else {
        			var roleTree = $.tree_create();
            		$(this).data('tree',roleTree);
                    roleTree.init($(this),$.extend({},conf));
        		}
    },
 
 
	      
	         
				 /*----------------------------表单数据AJAX提交---------------------------*/
				"queryDialog":function(setting){
						var p={					
						autoOpen : false,
						bgiframe : true,
						modal : true,
						resizable : false,
						draggable : false,
						width : 600,
						height : 500,
						success:function(data){alert(data)}									
					};
					 if(setting)	
					 p=$.extend(p,setting);					
					//构造弹出层
						$(this).dialog(p);
					//构造grid
					var grid=$('<div></div>');
					$(this).append(grid);
					grid.flexigrid(p.flexigrid);	
	
					var qtable=$(this).find('.qtable');		
				    var qbutton=$(this).find('.qbutton');
					$.each(qbutton,function(){
						$(this).click(function(){
							var filter=new Array();					
					    	$(':input[comparison]',qtable).each(function(){				    		  
					    		if($(this).val())
					    		filter.push({"field":this.name,"data":{"type":"string","value":$(this).val(),"comparison":$(this).attr("comparison")}});
						    	});
						    var params=new Array();
						    $(':input.param',qtable).each(function(){
						    	params.push({name:this.name,value:$(this).val()});
						    });					  
						    grid.flexReload(filter,params);						
						})
					});
				}			
          
       })
})(jQuery);