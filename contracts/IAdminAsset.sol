pragma solidity 0.6.6;

interface IAdminAsset {
    function isSuperAdmin(address _addr, string calldata _token) external view returns (bool);
}