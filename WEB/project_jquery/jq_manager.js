


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
    
    // 회원정보 Member 객체들을 저장하는 배열
    var members = []; // object -> 문자열  JSON

    // 생성자 함수 Member

    function Member(id, pw, name) {
    this.userid = id;
    this.userpw = pw;
    this.username = name;
    }

    

    
    
    /*// add member
    $('#regmember').on(click,function(){
        
    });*/
    
    
    
    
});