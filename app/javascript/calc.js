function calc(){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup",() => {
    const inputPrice = itemPrice.value;
    const calcFee = inputPrice * 0.1
    const calcProfit = inputPrice * 0.9
    const addTaxPrice = document.getElementById("add-tax-price")
    const profit = document.getElementById("profit")
    const x = Math.floor(calcFee)
    const y = Math.ceil(calcProfit)
    addTaxPrice.innerHTML = `${x}`
    profit.innerHTML = `${y}`
  });

}
window.addEventListener('load',calc)