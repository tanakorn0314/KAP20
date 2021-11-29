import { formatEther, parseEther } from "@ethersproject/units";
import { ethers } from "hardhat";

async function main() {
  const [owner, alice] = await ethers.getSigners();

  const AdminAsset = await ethers.getContractFactory("AdminAsset");
  const adminChangeKey = ethers.utils.formatBytes32String("P@ssw0rd");
  const adminAsset = await AdminAsset.deploy(owner.address, adminChangeKey);
  console.log("Admin ", adminAsset.address);

  const KYCBitkubChainV2 = await ethers.getContractFactory("KYCBitkubChainV2");
  const kycBitkubChainV2 = await KYCBitkubChainV2.deploy(adminAsset.address);
  console.log("KYC ", kycBitkubChainV2.address);

  const KUSDC = await ethers.getContractFactory("KUSDC");
  const kusdc = await KUSDC.deploy(adminAsset.address, kycBitkubChainV2.address);
  console.log("KUSDC ", kusdc.address);


  console.log("Set super admin");
  await adminAsset.addSuperAdmin(owner.address, await kusdc.symbol());

  console.log("Super admin call mint");
  await kusdc.mint(alice.address, parseEther('10'));
  console.log("Alice has: ", await kusdc.balanceOf(alice.address).then(res => formatEther(res)));

  await adminAsset.revokeSuperAdmin(owner.address, await kusdc.symbol());
  await adminAsset.addSuperAdmin(alice.address, await kusdc.symbol());

  await kusdc.connect(alice).mint(alice.address, parseEther('10'));
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
