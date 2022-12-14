function hide(value){
    alert("hide");
    if(value){
        Search.value = 'AC';
        Year.style = 'visibility : hidden';
        VoteCounter.style = 'visibility : hidden';
        Punctuation.style = 'visibility : hidden';
    }
    else{
        Search.value = 'PEL';
        Year.style = 'visibility = visible';
        VoteCounter.style = 'visibility : visible';
        Punctuation.style = 'visibility : visible';
    }
}