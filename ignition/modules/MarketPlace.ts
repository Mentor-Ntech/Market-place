import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const MarketPlaceModule = buildModule("MarketPlaceModule", (m) => {

  const market = m.contract("SimpleMarketplace"); 


  return { market };
});

export default MarketPlaceModule;