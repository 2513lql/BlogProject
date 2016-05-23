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

