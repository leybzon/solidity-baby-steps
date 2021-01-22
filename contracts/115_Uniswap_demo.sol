// SPDX-License-Identifier: MIT
//Demo of Uniswap for meetup
pragma solidity ^0.6.4;

import "https://github.com/Uniswap/uniswap-v2-core/blob/master/contracts/interfaces/IUniswapV2Factory.sol";
import "https://github.com/Uniswap/uniswap-v2-core/blob/master/contracts/interfaces/IUniswapV2Pair.sol";
import "https://github.com/Uniswap/uniswap-v2-periphery/blob/master/contracts/interfaces/IUniswapV2Router02.sol";



contract MeetupUniswapDemo {
    IUniswapV2Factory    private uniswap_v2_factory = IUniswapV2Factory(0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f); //per https://uniswap.org/docs/v2/smart-contracts/factory/
    IUniswapV2Router02   private uniswap_v2_router = IUniswapV2Router02(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D); //per https://uniswap.org/docs/v2/smart-contracts/factory/
    address WEH;  
    address private multiDaiKovan = 0x4F96Fe3b7A6Cf9725f59d353F723c1bDb64CA6Aa; //https://kovan.etherscan.io/token/0x4f96fe3b7a6cf9725f59d353f723c1bdb64ca6aa


    function getPathForETHtoDAI() private view returns (address[] memory) {
      address[] memory path = new address[](2);
      path[0] = WEH;
      path[1] = multiDaiKovan;
    
      return path;
    }
    
    function init() public {
        WEH=uniswap_v2_router.WETH();  
    }
    
    function getEstimatedETHforDAI(uint daiAmount) public view returns (uint[] memory) {
      return uniswap_v2_router.getAmountsIn(daiAmount, getPathForETHtoDAI());
    }
    
    function convertEthToDai(uint daiAmount) public payable {
      uint deadline = block.timestamp + 15; // using 'now' for convenience, for mainnet pass deadline from frontend!
      uniswap_v2_router.swapETHForExactTokens{ value: msg.value }(daiAmount, getPathForETHtoDAI(), address(this), deadline);
    
      // refund leftover ETH to user
      (bool success,) = msg.sender.call{ value: address(this).balance }("");
      require(success, "can not refund");
    }
    
    receive() external payable {}
}
