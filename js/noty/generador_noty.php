<script type="text/javascript">
function generate(type, text, tiempo) {
	if(!tiempo){
		tiempo=3000;
	}
    var n = noty({
        text        : text,
        type        : type,
        layout      : 'topCenter',
        theme       : 'relax',
        timeout     : tiempo
    });
}
</script>