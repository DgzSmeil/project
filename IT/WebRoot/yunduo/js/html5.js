(function(){
            var element=['header','footer','article','aside','section','nav','menu','hgroup','details','dialog','figure','figcaption'],
                len=element.length;
            while(len--){
                document.createElement(element[len])
            }
 })();