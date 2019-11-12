$(document).on('turbolinks:load', $(function() {
  
  $(document).on('dragover', '.sell-upload-drop-box', function(e){
    e.stopPropagation();
    e.preventDefalt();
    console.log('OK');
  });
  
  $(document).on('drop', '.sell-upload-drop-box', function (e) {
    event.preventDefault();
    var files = e.originalEvent.dataTransfer.files;
    manageFiles(files);
    console.log(files)
  });

  
}))



