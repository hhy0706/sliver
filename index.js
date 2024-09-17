const pinia = (() => {
    class ShopCart {
        goods = [];
        addItem(name, num) { 
            this.goods.push({name:name,num:num});
        }
        checkGoods() {
            for (const item of this.goods) { 
                console.log(`${item.name}  ${item.num}`);
            }
        }
    }
    return ShopCart();
})()
pinia.addItem('susu', 2);
pinia.addItem('apple', 3);
pinia.checkGoods();

// 1. 引入readline模块
var readline = require('readline');
var rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout});

// 2. 处理输入和输出
rl.on('line', function(line){
    let input = line.trim().split(' ').map(Number);
    let len = input[0];
    
    if(len == 0){
        console.log('list is empty');
        return;
    }
    // 根据输入创建链表
    let head = createLinkedList(input.slice(1));
        printLinkedList(head);

    // 翻转
    head = reverseLinkedList(head);
    // 打印结果
    printLinkedList(head);
})
// 创建链