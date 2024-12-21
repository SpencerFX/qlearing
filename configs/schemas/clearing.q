exposures:([] 
    memberID:`symbol$();         / Clearing member identifier
    exposure:`float$();          / Current exposure amount
    stressFactor:`float$();      / Stress factor for stress loss calculation
    lastUpdated:`datetime$()     / Timestamp of the last update
 );

defaultFund:([] 
    memberID:`symbol$();         / Clearing member identifier
    exposure:`float$();          / Member's exposure
    totalExposure:`float$();     / Total exposure across all members
    fundContribution:`float$();  / Contribution to the default fund
    lastUpdated:`datetime$()     / Timestamp of the last update
 );

liquidityCoverage:([] 
    memberID:`symbol$();         / Clearing member identifier
    highQualityLiquidAssets:`float$(); / Member's liquid assets
    netCashOutflows:`float$();   / Member's net cash outflows
    lcr:`float$();               / Liquidity Coverage Ratio
    lastUpdated:`datetime$()     / Timestamp of the last update
 );

pfe:([] 
    memberID:`symbol$();         / Clearing member identifier
    currentExposure:`float$();   / Current exposure amount
    alpha:`float$();             / Confidence multiplier (e.g., 95% confidence level)
    volatility:`float$();        / Daily market volatility
    timePeriod:`int$();          / Time period in days
    pfe:`float$();               / Calculated Potential Future Exposure
    lastUpdated:`datetime$()     / Timestamp of the last update
 );

settlementPrices:([] 
    instrument:`symbol$();       / Financial instrument identifier
    settlementDate:`date$();     / Date of settlement
    price:`float$();             / Settlement price
    lastUpdated:`datetime$()     / Timestamp of the last update
 );

stressLosses:([] 
    memberID:`symbol$();         / Clearing member identifier
    exposure:`float$();          / Current exposure amount
    stressFactor:`float$();      / Applied stress factor
    stressLoss:`float$();        / Calculated stress loss
    testDate:`date$()            / Date of the stress test
 );