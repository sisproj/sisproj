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

	$('#link_cho #doc_title').keyup(function(){
		var title = $(this).val();
		$('#cf_info #doctitle').val(title);
	});
	
	$('#link_cho #link_doc').change(function(){
		var linkdocNo = $('#link_cho #link_doc :selected').val();
		var linkdocName = $('#link_cho #link_doc :selected').text();
		if(linkdocNo!=''){
			$('#cf_info #linkCfNo').val(linkdocNo);	
			$('#cf_info #linkdoc').val("("+linkdocNo+")"+linkdocName);	
		} else {
			$('#cf_info #linkCfNo').val('');	
			$('#cf_info #linkdoc').val('');				
		}
	});
	
	$('#submitbtn #confirmbtn').click(function(){
		if(confirm('바로 다음 결재자에게 상신됩니다. 진행 하시겠습니까?')){
			submitContents();
			$('#writeType').val("결재대기");
			$('#writeFrm').submit();
		}
	});

	$('#submitbtn #savebtn').click(function(){
		submitContents();
		$('#writeType').val("임시저장");
		$('#writeFrm').submit();
	});
});