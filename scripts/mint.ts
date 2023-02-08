const CONTRACT_ADDRESS = "0xfbf450494732F3346373f4c608e37b9c86c0Ed30";

async function mintNFT(contractAddress: string) {
  const ExampleNFT = await ethers.getContractFactory("ItemMint");
  const [owner] = await ethers.getSigners();

  const tx = await ExampleNFT.attach(contractAddress).mintGold(
    2,
    "0x445935FeD8Cb41749D5e8176e60c9D2484FABF01"
  );

  // const tx = await ExampleNFT.attach(contractAddress).mintCrown(
  //   "0x445935FeD8Cb41749D5e8176e60c9D2484FABF01"
  // );

  tx.wait();
  console.log(
    "Token minted to: ",
    "0x445935fed8cb41749d5e8176e60c9d2484fabf01"
  );
}

mintNFT(CONTRACT_ADDRESS)
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
