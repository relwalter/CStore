function deleteConfirm() {
    if(confirm('请注意，所选内容将被清空且无法恢复！\n是否继续？')){
        return true;
    }
    else{
        return false;
    }
}