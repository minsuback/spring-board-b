$(function() {
	$("#searchBtn").on("click", function(event) {
		var inputVal = $("#searchForm input").val();
		
		console.log("inputval : " + inputVal);
		if (!inputVal) return;
		
		$("#searchBtn").attr("href", "/goodibooks/book/list.action?searchType=A&searchKey=" + inputVal);
	})
});