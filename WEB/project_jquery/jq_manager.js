


$(document).ready(function(){
   
    console.log('onload=ready()');
    
    $('*').css({
       padding: '0px',
       margin: '0px'
    });
    $('h1').css({
        margin:'20px',
        color:'blueviolet'
    });
    $('hr').css('border-top','2px solid #ccc');
    
     $('h2').css({
       margin:'20px 40px',     
       fontWeight:'500',
       color:'dimgrey'
    });
    
     $('#regform').css({
        margin: '25px'
    });
    
    $('#regform>table').css({
        width: '900px',
        color: 'dimgrey'
    });
    
    $('#regform>table input').css({
        padding: '5px',
        borderRadius: '6px',
        border: '2px solid #ccc',
        color: 'blueviolet'
    });
    
    $('div.msg').css({
        color:'coral',
        fontSize: '0.8em',
        display: 'none'
    });
    
    
    $('#regform>table input[type=submit]').css({
        width:'100px',
        height:'55px',
        backgroundColor:'blueviolet',
        color:'white',
        boder: '2px solid #ccc'
    });
    
    $('table').css({
        width:'900px',
        borderCollapse:'collapse',
        margin:'10px 40px'
    })
    
    $('table.table tr:first').css({
        background:'#eee'
    });
    
    
    
    
    //--------------------------------------------------------
    
    
    
    // 배열생성
    
    var members = [];
    
    function Member(id, pw, name) {
    this.userid = id;
    this.userpw = pw;
    this.username = name;
    }
    

    console.log(this.userid + ' : ' + this.userpw + ' : ' + this.username);

    var xml = '';
    xmlStr += '<tr>';
    xmlStr += ' <td>' + index + '</td>';
    xmlStr += ' <td>' + this.userid + '</td>';
    xmlStr += ' <td>' + this.userpw + '</td>';
    xmlStr += ' <td>' + this.username + '</td>';
    xmlStr += ' <td><a href="javascript:editMember(' + index + ')">수정</a> <a href="javascript:delmember(' + index + ')">삭제</a></td>';
    xmlStr += '</tr>';

   
    var xmlDoc = $.parseXML(xmlStr);
    
   $(xmlDoc).find('members').each(function(index){
       var userid = $(this).find('userid').text();
       var userpw = $(this).find('userpw').text();
       var username = $(this).find('username').text();
       
       var html='';
   })
    
   /* $.each(members, function(index, item ){
       console.log(index,item);
        
    var output = "";
        
    output += '<h4>' + item.userid + '</h4>';
    output += '<h4>' + item.password + '</h4>';
    output += '<h4>' + item.name+ '</h4>';
        
    documen.body.innerHTML += output;
        
        
    });
    */
    
    
    
    
});