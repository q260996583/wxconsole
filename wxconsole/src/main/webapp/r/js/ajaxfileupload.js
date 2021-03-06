jQuery
		.extend({
			createUploadIframe : function(d, b) {
				var a = "jUploadFrame" + d;
				if (window.ActiveXObject) {
					var c = document.createElement('<iframe id="' + a
							+ '" name="' + a + '" />');
					if (typeof b == "boolean") {
						c.src = "javascript:false"
					} else {
						if (typeof b == "string") {
							c.src = b
						}
					}
				} else {
					var c = document.createElement("iframe");
					c.id = a;
					c.name = a
				}
				c.style.position = "absolute";
				c.style.top = "-1000px";
				c.style.left = "-1000px";
				document.body.appendChild(c);
				return c
			},
			createUploadForm : function(g, b) {
				var e = "jUploadForm" + g;
				var a = "jUploadFile" + g;
				var d = $('<form  action="" method="POST" name="' + e
						+ '" id="' + e
						+ '" enctype="multipart/form-data"></form>');
				var c = $("#" + b);
				var f = $(c).clone();
				$(c).attr("id", a);
				$(c).before(f);
				$(c).appendTo(d);
				$(d).css("position", "absolute");
				$(d).css("top", "-1200px");
				$(d).css("left", "-1200px");
				$(d).appendTo("body");
				return d
			},
			ajaxFileUpload : function(l) {
				l = jQuery.extend({}, jQuery.ajaxSettings, l);
				var a = new Date().getTime();
				var b = jQuery.createUploadForm(a, l.fileElementId);
				var j = jQuery.createUploadIframe(a, l.secureuri);
				var i = "jUploadFrame" + a;
				var k = "jUploadForm" + a;
				if (l.global && !jQuery.active++) {
					jQuery.event.trigger("ajaxStart")
				}
				var c = false;
				var f = {};
				if (l.global) {
					jQuery.event.trigger("ajaxSend", [ f, l ])
				}
				var d = function(m) {
					var q = document.getElementById(i);
					try {
						if (q.contentWindow) {
							f.responseText = q.contentWindow.document.body ? q.contentWindow.document.body.innerHTML
									: null;
							f.responseXML = q.contentWindow.document.XMLDocument ? q.contentWindow.document.XMLDocument
									: q.contentWindow.document
						} else {
							if (q.contentDocument) {
								f.responseText = q.contentDocument.document.body ? q.contentDocument.document.body.innerHTML
										: null;
								f.responseXML = q.contentDocument.document.XMLDocument ? q.contentDocument.document.XMLDocument
										: q.contentDocument.document
							}
						}
					} catch (p) {
						jQuery.handleError(l, f, null, p)
					}
					if (f || m == "timeout") {
						c = true;
						var n;
						try {
							n = m != "timeout" ? "success" : "error";
							if (n != "error") {
								var o = jQuery.uploadHttpData(f, l.dataType);
								if (l.success) {
									l.success(o, n)
								}
								if (l.global) {
									jQuery.event.trigger("ajaxSuccess",
											[ f, l ])
								}
							} else {
								jQuery.handleError(l, f, n)
							}
						} catch (p) {
							n = "error";
							jQuery.handleError(l, f, n, p)
						}
						if (l.global) {
							jQuery.event.trigger("ajaxComplete", [ f, l ])
						}
						if (l.global && !--jQuery.active) {
							jQuery.event.trigger("ajaxStop")
						}
						if (l.complete) {
							l.complete(f, n)
						}
						jQuery(q).unbind();
						setTimeout(function() {
							try {
								$(q).remove();
								$(b).remove()
							} catch (r) {
								jQuery.handleError(l, f, null, r)
							}
						}, 100);
						f = null
					}
				};
				if (l.timeout > 0) {
					setTimeout(function() {
						if (!c) {
							d("timeout")
						}
					}, l.timeout)
				}
				try {
					var b = $("#" + k);
					$(b).attr("action", l.url);
					$(b).attr("method", "POST");
					$(b).attr("target", i);
					if (l.data) {
						for (aname in l.data) {
							var h = $(
									"<input type=hidden name=" + aname + " />")
									.val(l.data[aname]);
							$(b).append(h)
						}
					}
					if (b.encoding) {
						b.encoding = "multipart/form-data"
					} else {
						b.enctype = "multipart/form-data"
					}
					$(b).submit()
				} catch (g) {
					jQuery.handleError(l, f, null, g)
				}
				if (window.attachEvent) {
					document.getElementById(i).attachEvent("onload", d)
				} else {
					document.getElementById(i).addEventListener("load", d,
							false)
				}
				return {
					abort : function() {
					}
				}
			},
			uploadHttpData : function(r, type) {
				var data = !type;
				data = type == "xml" || data ? r.responseXML : r.responseText;
				if (type == "script") {
					jQuery.globalEval(data)
				}
				if (type == "json") {
					eval("data = " + data)
				}
				if (type == "html") {
					jQuery("<div>").html(data).evalScripts()
				}
				return data
			}
		});