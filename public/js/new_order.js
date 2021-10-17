quantites = document.getElementsByName("items[][quantity]")
get_sum()
quantites.forEach(function(item, i, arr) { item.onchange = get_sum })

function get_sum() {
    sum = 0
    quantites.forEach(function(item, i, arr) {
        price =  document.getElementById('p_' + item.id).innerText
        sum += price * item.value
        document.getElementById("sum").innerText = sum
        console.log(price)
        console.log("123" + sum)
    })
}

