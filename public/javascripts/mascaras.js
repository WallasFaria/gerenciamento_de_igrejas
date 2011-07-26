function mascara_data(campoData){
    v = campoData.value; 
    v=v.replace(/\D/g,"") 
    v=v.replace(/(\d{2})(\d)/,"$1/$2") 
    v=v.replace(/(\d{2})(\d)/,"$1/$2")
    campoData.value = v;
    if (v.length == 10){ 
        verifica_data(campoData); 
    } 
} 
 
function verifica_data (campoData) { 

  dia = (campoData.value.substring(0,2)); 
  mes = (campoData.value.substring(3,5)); 
  ano = (campoData.value.substring(6,10)); 

  situacao = ""; 
  // verifica o dia valido para cada mes 
  if ((dia < 01)||(dia < 01 || dia > 30) && (  mes == 04 || mes == 06 || mes == 09 || mes == 11 ) || dia > 31) { 
      situacao = "falsa"; 
  } 

  // verifica se o mes e valido 
  if (mes < 01 || mes > 12 ) { 
      situacao = "falsa"; 
  } 

  // verifica se e ano bissexto 
  if (mes == 2 && ( dia < 01 || dia > 29 || ( dia > 28 && (parseInt(ano / 4) != ano / 4)))) { 
      situacao = "falsa"; 
  } 

  if (campoData.value == "") { 
      situacao = "falsa"; 
  } 

  if (situacao == "falsa") { 
      alert("Data inválida!"); 
      campoData.focus(); 
  }
} 

function mascara_hora(campoHora){
    hora = campoHora.value; 
    var myhora = ''; 
    myhora = myhora + hora; 
    if (myhora.length == 2){ 
        myhora = myhora + ':'; 
        campoHora.value = myhora; 
    } 
    if (myhora.length == 5){ 
        verifica_hora(campoHora); 
    } 
} 
 
function verifica_hora(campoHora){ 
    hrs = (campoHora.value.substring(0,2)); 
    min = (campoHora.value.substring(3,5)); 
     
    alert('hrs '+ hrs); 
    alert('min '+ min); 
     
    situacao = ""; 
    // verifica data e hora 
    if ((hrs < 00 ) || (hrs > 23) || ( min < 00) ||( min > 59)){ 
        situacao = "falsa"; 
    } 
     
    if (campoHora.value == "") { 
        situacao = "falsa"; 
    } 

    if (situacao == "falsa") { 
        alert("Hora inválida!"); 
        campoHora.focus(); 
    }
  }
function mascara_telefone(campoTelefone){
  v = campoTelefone.value;
  v=v.replace(/\D/g,"")                 
  v=v.replace(/^(\d\d)(\d)/g,"($1) $2") 
  v=v.replace(/(\d{4})(\d)/,"$1-$2")
  campoTelefone.value = v;
  return true; 
} 
