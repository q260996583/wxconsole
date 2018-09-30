function fmtTime(rec,v) {
	if ( v ) {
		return v.substr(0,4) + '-' + v.substr(4,2) + '-' + v.substr(6,2) + ' ' + v.substr(8,2) + ':' + v.substr(10,2) + ':' + v.substr(12,2);
	}
	return '--';
}
function fmtTime6(rec,v) {
	if ( v ) {
		return v.substr(0,2) + ':' + v.substr(2,2) + ':' + v.substr(4,2);
	}
	return '--';
}
function fmtShortTime(rec,v) {
	if ( v ) {
		return v.substr(0,2) + '-' + v.substr(2,2) + ' ' + v.substr(4,2) + ':' + v.substr(6,2) + ':' + v.substr(8,2) ;
	}
	return '--';
}
function fmtMoney(rec,v) {
	var stripRe = /[\$,%]/g;

	v =  v !== undefined && v !== null && v !== '' ? parseFloat((parseInt(String(v).replace(stripRe, ""), 10)/100).toFixed(2),10) : '';
	v = (Math.round((v-0)*100))/100;
    v = (v == Math.floor(v)) ? v + ".00" : ((v*10 == Math.floor(v*10)) ? v + "0" : v);
    v = String(v);
    var ps = v.split('.');
    var whole = ps[0];
    var sub = ps[1] ? '.'+ ps[1] : '.00';
    var r = /(\d+)(\d{3})/;
    while (r.test(whole)) {
        whole = whole.replace(r, '$1' + ',' + '$2');
    }
    v = whole + sub;
    return v;
}
function fmtRate(rec,v) {
	var stripRe = /[\$,%]/g;

	v =  v !== undefined && v !== null && v !== '' ? parseFloat((parseInt(String(v).replace(stripRe, ""), 10)/100).toFixed(2),10) : '';
	v = (Math.round((v-0)*100))/100;
    v = (v == Math.floor(v)) ? v + ".00" : ((v*10 == Math.floor(v*10)) ? v + "0" : v);
    v = String(v);
    v = v+"%";
    return v;
}
function fmtRate3(rec,v) {
	var stripRe = /[\$,%]/g;

	v =  v !== undefined && v !== null && v !== '' ? parseFloat((parseInt(String(v).replace(stripRe, ""), 10)/1000).toFixed(3),10) : '';
	v = (Math.round((v-0)*1000))/1000;
    v = (v == Math.floor(v)) ? v + ".000" : ((v*10 == Math.floor(v*10)) ? v + "0" : v);
    v = String(v);
    v = v+"%";
    return v;
}
function fmtRate4(rec,v) {
	var stripRe = /[\$,%]/g;
	
	v =  v !== undefined && v !== null && v !== '' ? parseFloat((parseInt(String(v).replace(stripRe, ""), 10)/10000).toFixed(4),10) : '';
	v = (Math.round((v-0)*10000))/10000;
	v = (v == Math.floor(v)) ? v + ".0000" : ((v*10 == Math.floor(v*10)) ? v + "0" : v);
	v = String(v);
	v = v+"%";
	return v;
}
function fmtDate(rec, v) {
	if ( v ) {
		return v.substr(0,4) + '-' + v.substr(4,2) + '-' + v.substr(6,2);
	} 
	return '';
}

function fmtTime10(rec, v) {
	if ( v ) {
		return v.substr(0,2) + '-' + v.substr(2,2) + ' ' + v.substr(4,2) + ':' + v.substr(6,2) + ':' + v.substr(8,2);
	} 
	return '';
}

function frmMoney(v) {
	if ( v ) {
		var stripRe = /[\$,%]/g;
		v =  v !== undefined && v !== null && v !== '' ? parseFloat((parseInt(String(v).replace(stripRe, ""), 10)/100).toFixed(2),10) : '';
		v = (Math.round((v-0)*100))/100;
	    v = (v == Math.floor(v)) ? v + ".00" : ((v*10 == Math.floor(v*10)) ? v + "0" : v);
	}
	return v;
}
function frmRate(v) {
	if ( v ) {
		var stripRe = /[\$,%]/g;
		v =  v !== undefined && v !== null && v !== '' ? parseFloat((parseInt(String(v).replace(stripRe, ""), 10)/100).toFixed(2),10) : '';
		v = (Math.round((v-0)*100))/100;
	    v = (v == Math.floor(v)) ? v + ".00" : ((v*10 == Math.floor(v*10)) ? v + "0" : v);
	}
	return v;
}
function frmRate3(v) {
	if ( v ) {
		var stripRe = /[\$,%]/g;
		v =  v !== undefined && v !== null && v !== '' ? parseFloat((parseInt(String(v).replace(stripRe, ""), 10)/1000).toFixed(3),10) : '';
		v = (Math.round((v-0)*1000))/1000;
		v = (v == Math.floor(v)) ? v + ".000" : ((v*10 == Math.floor(v*10)) ? v + "0" : v);
	}
	return v;
}
function frmRate4(v) {
	if ( v ) {
		var stripRe = /[\$,%]/g;
		v =  v !== undefined && v !== null && v !== '' ? parseFloat((parseInt(String(v).replace(stripRe, ""), 10)/10000).toFixed(4),10) : '';
		v = (Math.round((v-0)*10000))/10000;
		v = (v == Math.floor(v)) ? v + ".0000" : ((v*10 == Math.floor(v*10)) ? v + "0" : v);
	}
	return v;
}
function frmDate(v) {
	if ( v ) {
		return v.substr(4,2) + '/' + v.substr(6,2) + '/' + v.substr(0,4);
	}
	return v;
}
function frmTime(v) {
	if ( v ) {
		return v.substr(4,2) + '/' + v.substr(6,2) + '/' + v.substr(0,4) + ' ' + v.substr(8,2) + ':' + v.substr(10,2) + ':' + v.substr(12,2);
	}
	return v;
}
function frmTime6(v) {
	if ( v ) {
		return v.substr(0,2) + ':' + v.substr(2,2) + ':' + v.substr(4,2);
	}
	return v;
}
//render
function frmBSTime(v) {
	if ( v ) {
//		return v.substr(4,2) + '/' + v.substr(6,2) + '/' + v.substr(0,4) + ' ' + v.substr(8,2) + ':' + v.substr(10,2) + ':' + v.substr(12,2);
		return v.substr(0,4) +  '-' + v.substr(4,2) + '-' + v.substr(6,2) + ' ' + v.substr(8,2) + ':' + v.substr(10,2) ;
	}
	return v;
}
function frmBSDate(v) {
	if ( v ) {
		return v.substr(0,4) + '-' +  v.substr(4,2) + '-' + v.substr(6,2) ;
	}
	return v;
}

function fmtCardNo(rec,v){
	if(v){
		var len = v.length;
		var midlen = len -10;
		var start = v.substr(0,6);
		var mid='';
		var end = v.substr((6+midlen-1),4);
		for(var i =0;i<midlen;i++){
			mid +='*';
		}
		return start+mid+end;
	}
	return v;
}