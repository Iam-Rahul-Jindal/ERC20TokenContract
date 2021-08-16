pragma solidity >=0.4.22 <0.6.0;

contract ERC20Basic {

    string public constant nameOfToken = "ERC20Basic";
    string public constant symbolOfToken = "BSC";
    uint8 public constant numberOFDecimals = 18;  


    event Approval(address indexed ownerOfToken, address indexed spenderOfToken, uint numOfTokens);
    event Transfer(address indexed from, address indexed to, uint numOftokens);


    mapping(address => uint256) balance;

    mapping(address => mapping (address => uint256)) allowed;
    
    uint256 totalSupply;

    using SafeMath for uint256;


   constructor(uint256 total) public {  
	totalSupply = total;
	balances[msg.sender] = totalSupply;
    }  

    function totalSupply() public view returns (uint256) {
	return totalSupply;
    }
    
    function balanceOf(address ownerOfToken) public view returns (uint) {
        return balance[ownerOfToken];
    }

    function transfer(address receiver, uint numTokens) public returns (bool) {
        require(numTokens <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender].sub(numTokens);
        balances[receiver] = balances[receiver].add(numTokens);
        emit Transfer(msg.sender, receiver, numTokens);
        return true;
    }

    function approve(address delegate, uint numOfTokens) public returns (bool) {
        allowed[msg.sender][delegate] = numOFTokens;
        Approval(msg.sender, delegate, numOfTokens);
        return true;
    }

    function allowance(address owner, address delegate) public view returns (uint) {
        return allowed[owner][delegate];
    }

    function transferFrom(address owner, address buyer, uint numOfTokens) public returns (bool) {
        require(numOfTokens <= balance[owner]);    
        require(numOfTokens <= allowed[owner][msg.sender]);
    
        balance[owner] = balance[owner].sub(numTokens);
        allowed[owner][msg.sender] = allowed[owner][msg.sender].sub(numOfTokens);
        balances[buyer] = balance[buyer].add(numTokens);
        Transfer(owner, buyer, numOfTokens);
        return true;
    }
}

library SafeMath { 
    function subtract(uint256 a, uint256 b) internal pure returns (uint256) {
      assert(b <= a);
      return a - b;
    }
    
    function addNum(uint256 a, uint256 b) internal pure returns (uint256) {
      uint256 c = a + b;
      assert(c >= a);
      return c;
    }
}