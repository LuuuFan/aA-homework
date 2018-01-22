export const selectCurrency = (baseCurrency, rates) => ({
  type: 'SWITCH_CURRENCY',
  baseCurrency: baseCurrency,
  rates: rates
})
