export const selectCurrency = (baseCurrency, rates) => ({
  type: 'SWITCH_CURRENCY',
  baseCurrency: baseCurrency,
  rates: rates
});

//
// const selectCurrency = (baseCurrency, rates) => {
//   return {
//     type: "SWITCH_CURRENCY",
//     baseCurrency: baseCurrency,
//     rates: rates
//   };
// };
//
// export default selectCurrency;
