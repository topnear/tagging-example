$(document).on("page:change", function() {
	$(".article-tags").tagit({
		singleField: true,
		fieldName: "article[tag_list]"
	})
})