/**
 * Created by LQL on 2016/5/21.
 */
function addEvent(obj,event,eventHandler){
    if(obj.addEventListener){
        obj.addEventListener(event,eventHandler,false);
    }else{
        event += 'on';
        obj.attachEvent(event , eventHandler);
    }
}

/*去掉字符串前后空格*/
String.prototype.mytrim=function(){
    return this.replace(/(^\s*)|(\s*$)/g,'');
}
