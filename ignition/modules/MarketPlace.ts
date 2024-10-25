import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const MarketPlaceModule = buildModule("MarketPlaceModule", (m) => {

  const MarketPlace = m.contract("MarketPlace");

  return { MarketPlace };
});

export default MarketPlaceModule;