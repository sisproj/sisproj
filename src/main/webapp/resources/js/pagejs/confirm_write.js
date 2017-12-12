/**
 * 결재 write부분 js파일
 */
function submitContents() {
	 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
}

var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "/sisproj/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});

$(function(){
	$('#fileQty').change(function(){
		var qty = $(this).val();
		alert("선택된 파일 개수 : "+qty+"개");

		if(qty==1){
			$('#files').html("<input type='file' name='file1' id='file1'>");
		} else if(qty==2){
			$('#files').html("<input type='file' name='file1' id='file1'><br><input type='file' name='file2' id='file2'>");
		} else if(qty==3){
			$('#files').html("<input type='file' name='file1' id='file1'><br><input type='file' name='file2' id='file2'><br><input type='file' name='file3' id='file3'>");
		} else if(qty==4){
			$('#files').html("<input type='file' name='file1' id='file1'><br><input type='file' name='file2' id='file2'><br><input type='file' name='file3' id='file3'><br><input type='file' name='file4' id='file4'>");
		} else {
			$('#files').html("");			
		}
		
		$('#fileinfo').text('새로 첨부할 파일');
	});

	$('#submit').click(function(){
		$('#savetype').val($(this).attr('id'));
		submitContents();
		/*alert("#ir1 textarea부분!"+$('#ir1').val());
		$('#writeFrm').submit();*/
	});
	$('#save').click(function(){
		$('#savetype').val($(this).attr('id'));
		submitContents();
		/*alert($('#ir1').val());
		$('#writeFrm').submit();*/
	});
});