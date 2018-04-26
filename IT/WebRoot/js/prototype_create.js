var Class = (function(){
    function subclass() {};
    function create(){
        //返回一个空函数
        //if(arguments.length==0) return new Function();
        //设置父函数
        var ars = [],parent = null;
        for(var i=0;i<arguments.length;i++){
            ars.push(arguments[i])
        }
        function klass() {
          this.initialize.apply(this, arguments);
        }
        parent = ars.shift();
        klass.superclass = parent;
        klass.subclasses = [];
        //
        if (parent) {
          subclass.prototype = parent.prototype;
          klass.prototype = new subclass;
          parent.subclasses.push(klass);
        }
        if (!klass.prototype.initialize)
            klass.prototype.initialize = new Function();
        klass.prototype.constructor = klass;
        return klass;
    }
    return {
        create:create
    }
})()