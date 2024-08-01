import { dbank_backend as dbank }  from  "../../declarations/dbank_backend";


window.addEventListener("load",async ()=>{
  const currentAmount = await dbank.checkBalance();
  console.log(dbank.checkBalance());

  document.getElementById("value").innerText = Math.round(currentAmount*100)/100;
});

