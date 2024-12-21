/ Function to calculate Initial Margin
/ Initial Margin Example
/ weights: 0.2 0.3 0.5;
/ prices: 100 200 300;
/ volatilities: 0.05 0.03 0.02;
/ im: initialMargin[weights; prices; volatilities] / Call function
initialMargin: {[weights; prices; volatilities]
    sqrt sum (weights * prices * volatilities) * (weights * prices * volatilities)
 };

/ Function to calculate Variation Margin
/ Inputs
/ markToMarketPrice: 105.5; / Current market price of the asset
/ originalTradePrice: 100;  / Price at which the trade was originally executed
/ Calculate Variation Margin
/ vm: variationMargin[markToMarketPrice; originalTradePrice]
/ Output Result
/ vm
/ 5.5
variationMargin: {[markToMarketPrice; originalTradePrice]
    markToMarketPrice - originalTradePrice
 };

/ Function to calculate Value-at-Risk
/ Inputs
/ mu: 0.05;          / Expected return (5%)
/ z: 1.645;          / Z-score for 95% confidence level
/ sigma: 0.02;       / Standard deviation of returns (2%)
/ Calculate VaR
/ var: valueAtRisk[mu; z; sigma]
/ Output Result
/ var
/ 0.0171
valueAtRisk: {[mu; z; sigma]
    mu - z * sigma
 };

/ Function to calculate Net Obligation
/ Inputs
/ payableAmounts: 100 200 150;    / Amounts the entity must pay
/ receivableAmounts: 50 100 50;   / Amounts the entity will receive
/ Calculate Net Obligation
/ netObl: netObligation[payableAmounts; receivableAmounts]
/ Output Result
/ netObl
/ 250
netObligation: {[payableAmounts; receivableAmounts]
    sum payableAmounts - sum receivableAmounts
 };

/ Function to calculate Interest on Margin
/ Inputs
/ marginAmount: 10000;        / Margin posted (e.g., $10,000)
/ interestRate: 0.05;         / Annual interest rate (5%)
/ days: 30;                   / Number of days the margin is held
/ Calculate Interest on Margin
/ interest: interestOnMargin[marginAmount; interestRate; days]
/ interest
/ 41.66666667
interestOnMargin: {[marginAmount; interestRate; days]
    marginAmount * interestRate * (days % 360)
 };

/ Function to calculate Clearing Fund Contribution
/ Inputs
/ riskExposure: 500000;        / Member's risk exposure (e.g., $500,000)
/ coefficient: 0.02;           / Fund requirement coefficient (e.g., 2%)
/ Calculate Clearing Fund Contribution
/ contribution: clearingFundContribution[riskExposure; coefficient]
/ Output Result
/ contribution
/ 10000
clearingFundContribution: {[riskExposure; coefficient]
    riskExposure * coefficient
 };

/ Function to calculate Settlement Price
/ Inputs
/ bidPrices: 100 101 99;      / List of bid prices
/ askPrices: 102 103 101;     / List of ask prices
/ Calculate Settlement Price
/ price: settlementPrice[bidPrices; askPrices]
/ Output Result
/ price
/ 101
/ Inputs
/ bidPricesList: (100 101 99; 120 121 119);  / List of bid prices for two assets
/ askPricesList: (102 103 101; 122 123 121); / List of ask prices for two assets
/ Calculate Settlement Prices for all assets
/ prices: settlementPrice each (bidPricesList; askPricesList)
/ Output Result
/ prices
/ 101 121
settlementPrice: {[bidPrices; askPrices]
    (sum bidPrices + sum askPrices) % (count bidPrices + count askPrices)
 };

/ Function to calculate Potential Future Exposure
/ The potentialFutureExposure function is designed to compute the exposure risk based on market volatility, time, and a confidence multiplier. 
/ Inputs
/ currentExposure: 100000;    / Current exposure in dollars
/ alpha: 1.645;              / Confidence multiplier (e.g., 95% confidence level)
/ volatility: 0.02;          / Daily volatility (2%)
/ timePeriod: 30;            / Time period in days
/ Calculate Potential Future Exposure
/ pfe: potentialFutureExposure[currentExposure; alpha; volatility; timePeriod]
/ Output Result
/ pfe
/ 109012.23
/ Inputs - Multiple counter-parties
/ currentExposures: 100000 150000 200000;    / Current exposures for different counterparties
/ alphas: 1.645 2.33 1.96;                  / Confidence multipliers for 95%, 99%, and 97.5% confidence levels
/ volatilities: 0.02 0.03 0.025;            / Daily volatilities
/ timePeriods: 30 60 45;                    / Time periods in days
/ Calculate PFE for each counterparty
/ pfes: potentialFutureExposure each (currentExposures; alphas; volatilities; timePeriods)
/ Output Result
/ pfes
/ 109012.23 175960.62 219097.59
potentialFutureExposure: {[notionalAmount; exposureMultiplier]
    notionalAmount * exposureMultiplier
 };

/ Function to calculate Liquidity Coverage Ratio
/ Inputs
/ highQualityLiquidAssets: 500000;    / High-quality liquid assets (e.g., $500,000)
/ netCashOutflows: 300000;            / Net cash outflows over a 30-day stress period (e.g., $300,000)
/ Calculate Liquidity Coverage Ratio
/ lcr: liquidityCoverageRatio[highQualityLiquidAssets; netCashOutflows]
/ Output Result
/ lcr
/ 1.666666667
liquidityCoverageRatio: {[highQualityLiquidAssets; netCashOutflows]
    highQualityLiquidAssets % netCashOutflows
 };

/ Function to calculate Default Fund Contribution
/ Inputs
/ memberExposure: 500000;    / Member's risk exposure (e.g., $500,000)
/ totalExposure: 2000000;    / Total risk exposure of all members (e.g., $2,000,000)
/ defaultFundSize: 1000000;  / Total default fund size (e.g., $1,000,000)
/ Calculate Default Fund Contribution
/ contribution: defaultFundContribution[memberExposure; totalExposure; defaultFundSize]
/ Output Result
/ contribution
/ 250000
defaultFundContribution: {[memberExposure; totalExposure; totalFundSize]
    (memberExposure % totalExposure) * totalFundSize
 };

/ Function to calculate Stress Loss
/ Inputs
/ exposure: 1000000;        / Current exposure in dollars (e.g., $1,000,000)
/ stressFactor: 0.15;       / Stress factor as a percentage (e.g., 15% or 0.15)
/ Calculate Stress Loss
/ loss: stressLoss[exposure; stressFactor]
/ Output Result
/ loss
/ 150000
stressLoss: {[exposure; stressFactor]
    exposure * stressFactor
 };