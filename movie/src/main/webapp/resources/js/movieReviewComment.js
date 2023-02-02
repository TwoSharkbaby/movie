console.log("Comment Module......");
var movieReviewCommentService = (function() {

   function add(comment, callback, error){
     console.log("add comment.......");
     $.ajax({
       type: 'post',
      url: '/comment/new', // URI
      data: JSON.stringify(comment), // { "reply":"JS TEST", "replyer" : "tester","bno" : 1572827 }
      contentType : "application/json; charset=utf-8", 
      success : function(result, status, xhr){
        if(callback){
          callback(result);
        }
      },
      error : function(xhr, status, er){
          if(error){
            error(er);
          }
      }
    });
  }

  function getList(param, callback, error){
      var mov_rev_num = param.mov_rev_num;
      var page = param.page || 1;
      $.getJSON( 
          "/comment/pages/"+mov_rev_num+"/"+ page + ".json",
          function(data1){ 
            if(callback){
              callback(data1);
            }
          }
        ).fail(function(xhr, status, err){
          if(error){
            error();
          }
        });
   }



   function remove(mov_rev_com_num, mem_num ,callback, error){
      $.ajax({
        type: 'delete',
        url: '/comment/' + mov_rev_com_num,

                data : JSON.stringify({mov_rev_com_num:mov_rev_com_num , mem_num:mem_num}),

        contentType : "application/json; charset=utf-8",

        success : function(deleteResult, status, xhr){
          if(callback){
            callback(deleteResult);
          }
        },
        error : function(xhr, status, er){
            if(error){
              error(er);
            }
        }
      });
   }  
  
   function update(comment, callback, error){
    $.ajax({
      type: 'put',
      url: '/comment/' + comment.mov_rev_com_num, 
      data: JSON.stringify(comment),
      contentType : "application/json; charset=utf-8", 
      success : function(result, status, xhr){
        if(callback){
          callback(result);
        }
      },
      error : function(xhr, status, er){
          if(error){
            error(er);
          }
      }
    });
   }

   function get(mov_rev_com_num, callback, error){
      $.ajax({
        type: 'get',
        url: '/comment/' + mov_rev_com_num,
        success : function(result, status, xhr){
          if(callback){
            callback(result);
          }
        },
        error : function(xhr, status, er){
            if(error){
              error(er);
            }
        }
      });
   }

   function displayTime(timeValue){
      var today = new Date();
      var gap = today.getTime() - timeValue;
      var dateObj = new Date(timeValue);

      if(gap < (1000 * 60 * 60 * 24)){
        var hh = dateObj.getHours();
        var mi = dateObj.getMinutes();
        var ss = dateObj.getSeconds();
        return [
          (hh>9?'':'0')+hh, ':', 
          (mi>9?'':'0')+mi, ':',
          (ss>9?'':'0')+ss
        ].join('');
      } else {
        var yy = dateObj.getFullYear();
        var mm = dateObj.getMonth() + 1;
        var dd = dateObj.getDate();
        return [
          yy, '/', (mm>9?'':'0') + mm, 
          '/', (dd>9?'':'0') + dd
        ].join('');
      }
   }

  return  { 
            add:add,
            getList:getList,
            remove:remove,
            update:update,
            get:get,
            displayTime : displayTime
          };
})();