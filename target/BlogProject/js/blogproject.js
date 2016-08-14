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

/**
 * 删除左右两边空格
 * @returns {string}
 */
String.prototype.trim=function()
{
    return this.replace(/(^\s*)|(\s*$)/g,'');
}