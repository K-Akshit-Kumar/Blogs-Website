function doLike(pid,uid){
	var likes = document.querySelector(".likes");
	const xhr = new XMLHttpRequest();
	xhr.onload = function(){
		likes.innerText = this.responseText;
		var c = parseInt(likes.innerText);
		c++;
		likes.innerText = c;
	}
	xhr.open("GET","LikeServlet?pid="+pid+"&uid="+uid,true);
	xhr.send();
}