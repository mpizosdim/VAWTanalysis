function V = WindVelocityCalc(obj,H,Z_r,z)
V = obj.VatmosphericEquator*((z+H+Z_r)./(H+Z_r)).^obj.windShearExponent;