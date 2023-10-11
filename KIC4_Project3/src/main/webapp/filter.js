/**
 *  상품 필터 검색
 */

var filter1=[];
var filter2="";
var filter3="";
var filter4="";
var filter5=[];

$(function(){
	//이름이 pcategory인 checkbox를 클릭했을때
   	$('input:checkbox[name=pcategory]').on("click", function(){
   		//만약 체크가 되어있다면
	   	if($(this).is(":checked")==true){
	   		//배열에 value값을 넣는다.
	   		filter1.push($(this).val());	
	   	} else{
			//체크해제시 배열에서 삭제
			var deleteItem=(filter1,value)=>filter1.filter(x=>x!=value);
			filter1=deleteItem(filter1,$(this).val());
		 }
   		console.log(filter1);
	})   			
}) 

$(function(){
   	$('input:checkbox[id=alcdegree]').on("click", function(){
		   
	   	if($('input:checkbox[name=alcdegree1]').is(":checked")==true){
	   	filter2="between 0 and 10"
	   		if($('input:checkbox[name=alcdegree2]').is(":checked")==true){
			filter2="between 0 and 20"
				if($('input:checkbox[name=alcdegree3]').is(":checked")==true){
				filter2="between 0 and 30"
					if($('input:checkbox[name=alcdegree4]').is(":checked")==true){
					filter2=">=0"
					}
				}else if($('input:checkbox[name=alcdegree4]').is(":checked")==true){
					filter2="between 0 and 20 or alcdegree >=30"
				}	
			} else if($('input:checkbox[name=alcdegree3]').is(":checked")==true){
				filter2="between 0 and 10 or alcdegree between 20 and 30"
					if($('input:checkbox[name=alcdegree4]').is(":checked")==true){
					filter2="between 0 and 10 or alcdegree >=20"
					}
			} else if($('input:checkbox[name=alcdegree4]').is(":checked")==true){
					filter2="between 0 and 10 or alcdegree >=30"
			}
					
		} else if($('input:checkbox[name=alcdegree2]').is(":checked")==true){
			filter2="between 10 and 20"
				if($('input:checkbox[name=alcdegree3]').is(":checked")==true){
				filter2="between 10 and 30"
					if($('input:checkbox[name=alcdegree4]').is(":checked")==true){
					filter2=">=10"
					}
				} else if($('input:checkbox[name=alcdegree4]').is(":checked")==true){
					filter2="between 10 and 20 or alcdegree >=30"
				}
				
		}else if($('input:checkbox[name=alcdegree3]').is(":checked")==true){
				filter2="between 20 and 30"
				if($('input:checkbox[name=alcdegree4]').is(":checked")==true){
					filter2=">=20"
				}
				
		} else if($('input:checkbox[name=alcdegree4]').is(":checked")==true){
				filter2=">=30"
		} else{
			filter2="";
		}
				
   		console.log(filter2);
	})		
}) 

function pricecheck1(){
		filter3=$('#priceFrom').val();
		console.log(filter3);
}

function pricecheck2(){
		filter4=$('#priceTo').val();
		console.log(filter4);
}

$(function(){
   	$('input:checkbox[name=pperson]').on("click", function(){
	   	if($(this).is(":checked")==true){
	   		filter5.push($(this).val());	
	   	} else{
			var deleteItem=(filter5,value)=>filter5.filter(x=>x!=value);
			filter5=deleteItem(filter5,$(this).val());
		 }
   		console.log(filter5);
	})   			
}) 



function filterSearch(){
	if(filter3==null || filter3==""){
		filter3=$('#priceFrom').attr('placeholder');
	}
	if(filter4==null || filter4==""){
		filter4="1000000";
	}
	$('#divReloadLayer').load(location.href+' #divReloadLayer', "pcategory="+filter1+"&alcdegree="+filter2+"&pprice1="+filter3+"&pprice2="+filter4+"&pperson="+filter5+"&sort="+sort);
}

function reset(){
	if($("input:checkbox[name='pcategory']").is(":checked") == true){
		$("input:checkbox[name='pcategory']").prop("checked", false);
		filter1.splice(0);
		console.log(filter1);
	}
	if($("input:checkbox[id='alcdegree']").is(":checked") == true){
		$("input:checkbox[id='alcdegree']").prop("checked", false);
		filter2="";
		console.log(filter2);
	}
	if(filter3!=null || filter3!=""){
		$('#priceFrom').val('priceFrom');
		filter3="";
		console.log(filter3);
	}
	if(filter4!=null || filter4!=""){
		$('#priceTo').val('priceTo');
		filter4="";
		console.log(filter4);
	}
	if($("input:checkbox[name='pperson']").is(":checked") == true){
		$("input:checkbox[name='pperson']").prop("checked", false);
		filter5.splice(0);
		console.log(filter5);
	}
	
}

/*
	조건별 정렬
*/

var sort="";

function sortChange(){
	if(filter3==null || filter3==""){
		filter3=$('#priceFrom').attr('placeholder');
	}
	if(filter4==null || filter4==""){
		filter4="1000000";
	}

	if($('#SortBy option:selected').val()=="PID DESC"){
		sort="PID DESC";
	} else if($('#SortBy option:selected').val()=="pprice DESC"){
		sort="pprice DESC";
	} else if($('#SortBy option:selected').val()=="pprice ASC"){
		sort="pprice ASC";
	}
	console.log(sort)
	$('#divReloadLayer').load(location.href+' #divReloadLayer', "pcategory="+filter1+"&alcdegree="+filter2+"&pprice1="+filter3+"&pprice2="+filter4+"&pperson="+filter5+"&sort="+sort);
}

