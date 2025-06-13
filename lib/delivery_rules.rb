class DeliveryRules
  LIST = [
    { min: 0.0, max: 50.0, charge: 4.95 },
    { min: 50.0, max: 90.0, charge: 2.95 },
    { min: 90.0, max: Float::INFINITY, charge: 0.0 }
  ]
end