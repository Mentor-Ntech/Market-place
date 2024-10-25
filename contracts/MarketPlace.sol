// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleMarketplace {
    struct Item {
        string name;
        uint price;
        address payable seller;
        bool isSold;
    }

    Item[] public items;

    event ItemAdded(uint itemId, string name, uint price, address seller);
    event ItemPurchased(uint itemId, address buyer);

    // Add an item for sale
    function addItem(string memory _name, uint _price) public {
        require(_price > 0, "Price must be greater than zero");

        items.push(Item({
            name: _name,
            price: _price,
            seller: payable(msg.sender),
            isSold: false
        }));

        emit ItemAdded(items.length - 1, _name, _price, msg.sender);
    }

    // Purchase an item
    function purchaseItem(uint _itemId) public payable {
        Item storage item = items[_itemId];
        require(!item.isSold, "Item already sold");
        require(msg.value == item.price, "Incorrect ETH amount");

        item.seller.transfer(msg.value);
        item.isSold = true;

        emit ItemPurchased(_itemId, msg.sender);
    }

    // Get the total number of items
    function getItemCount() public view returns (uint) {
        return items.length;
    }

    // Get details of an item
    function getItem(uint _itemId) public view returns (string memory, uint, address, bool) {
        Item storage item = items[_itemId];
        return (item.name, item.price, item.seller, item.isSold);
    }
}
