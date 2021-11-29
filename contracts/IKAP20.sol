pragma solidity 0.6.6;

interface IKAP20 {
    event Transfer(address indexed from, address indexed to, uint256 tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint256 tokens);
    event Paused(address _addr);
    event Unpaused(address _addr);
    event AddBlacklist(address indexed _blacklistAddr, address indexed _caller);
    event RevokeBlacklist(address indexed _blacklistAddr, address indexed _caller);
    
    function totalSupply() external view returns (uint256);
    
    function paused() external view returns (bool);

    function balanceOf(address tokenOwner) external view returns (uint256 balance);

    function allowance(address tokenOwner, address spender) external view returns (uint256 remaining);

    function transfer(address to, uint256 tokens) external returns (bool success);

    function approve(address spender, uint256 tokens) external returns (bool success);

    function transferFrom(address from, address to, uint256 tokens) external returns (bool success);
    
    function getOwner() external view returns (address);
    
    function adminTransfer(address _from, address _to, uint256 _value) external returns (bool success);
    
    function pause() external;

    function unpause() external;
    
    function addBlacklist(address _addr) external;
    
    function revokeBlacklist(address _addr) external;
}