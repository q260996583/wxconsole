function display(id) {
	var traget = document.getElementById(id);
	if (traget.style.display == "none") {
		traget.style.display = "";
	} else {
		traget.style.display = "none";
	}
}

function to_date8(d){
	var  dt='';
	if(d==''){
	 	return dt
	}else{
	   	dt =d.substring(0, 4)+'-'+ d.substring(4,6)+'-'+d.substring(6,8) ;
	   	return dt;
	}
}


function to_date14(d){
   var  dt='';
   if(d==''){
   	  return dt
   }else{
	   dt =d.substring(0, 4)+'-'+ d.substring(4,6)+'-'+d.substring(6,8)+' '+d.substring(8,10)+':'+d.substring(10,12)+':'+d.substring(12,14);
	   return dt;
   }
}


function to_date(date){
	var dt='';
	if(date.length=='8'){
		dt =date.substring(0, 4)+'-'+ date.substring(4,6)+'-'+date.substring(6,8) ;
		return dt;
	}else if(date.length=='14'){
		 dt =date.substring(0, 4)+'-'+ date.substring(4,6)+'-'+date.substring(6,8)+' '+date.substring(8,10)+':'+date.substring(10,12)+':'+date.substring(12,14)  ;
	   return dt;
	}else{
		return dt;
	}
}

function formReset(){
	$('#mer_Id').val('');
	$('#org_Name').val('');
	$('#buss_Id').val('');
	$('#buss_Name').val('');
	$('#suporg_code').val('');
}
