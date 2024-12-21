/ Script to Populate Clearing System Tables with Random Data
/ Generate Random Member IDs and Ticker Symbols
genMemberIDs:{`$("member",/:string til 10000)};
genTickerSymbols:{`AAPL`GOOG`MSFT`AMZN`TSLA`META`NFLX`NVDA`BABA`JPM} / Common ticker symbols


/ Initialize tables with empty schemas
exposures:([] memberID:`symbol$(); exposure:`float$(); stressFactor:`float$(); lastUpdated:`timestamp$());

defaultFund:([] memberID:`symbol$(); exposure:`float$(); totalExposure:`float$(); fundContribution:`float$(); lastUpdated:`timestamp$());

stressLosses:([] memberID:`symbol$(); exposure:`float$(); stressFactor:`float$(); stressLoss:`float$(); testDate:`date$());

liquidityCoverage:([] memberID:`symbol$(); highQualityLiquidAssets:`float$(); netCashOutflows:`float$(); lcr:`float$(); lastUpdated:`timestamp$());

pfe:([] memberID:`symbol$(); currentExposure:`float$(); alpha:`float$(); volatility:`float$(); timePeriod:`int$(); pfe:`float$(); lastUpdated:`timestamp$());

settlementPrices:([] instrument:`symbol$(); settlementDate:`date$(); price:`float$(); lastUpdated:`timestamp$());


/ Populate exposures table
{`exposures insert x} each {(x; rand[1000000.0]; rand[0.25]; .z.p - rand[1])} each genMemberIDs[];

/ Populate defaultFund table
{`defaultFund insert x} each {(x; rand[1000000.0]; 20000000.0; rand[50000.0]; .z.p - rand[1])} each genMemberIDs[];

/ Populate stressLosses table
{`stressLosses insert x} each {(x; rand[1000000.0]; rand[0.2]; rand[200000.0]; .z.d - rand[30])} each genMemberIDs[]

/ Populate liquidityCoverage table
{liquidityCoverage insert x} each {(x; rand[1000000.0]; rand[500000.0]; rand[3.0]; .z.p - rand[1])} each genMemberIDs[];

/ Populate pfe table
{`pfe insert x} each {(x; rand[1000000.0]; rand[2.0]; rand[0.05]; 1 + rand[90]; rand[500000.0]; .z.p - rand[1])} each genMemberIDs[];

/ Populate settlementPrices table
{`settlementPrices insert x} each {(y; .z.d - rand[90]; rand[5000.0]; .z.p - rand[1])} each genTickerSymbols[];
