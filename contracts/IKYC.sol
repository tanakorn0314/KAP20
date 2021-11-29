pragma solidity 0.6.6;

interface IKYC {
    function kycsLevel(address _addr) external view returns (uint256);
}