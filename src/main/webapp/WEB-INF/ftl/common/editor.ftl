<!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
    <script src="${basePath}/js/jquery.js"></script>
    <script type="text/javascript" src="${basePath}/plugins/wangEditor/wangEditor.min.js"></script>
    <script type="text/javascript">
        var E = window.wangEditor;
        var editor = new E('#editor1');
        //  var editor = new E( document.getElementById('editor1') );
        editor.customConfig.uploadFileName = 'file';
        // 监控变化，同步更新到 textarea
        var $text1 = $('#editorText');
        editor.customConfig.onchange = function (html) {
            $text1.val(html);
        }
        // 配置服务器端地址
        editor.customConfig.uploadImgServer = '${basePath}/file/wangEditorUploadImg';
        editor.create();
    </script>