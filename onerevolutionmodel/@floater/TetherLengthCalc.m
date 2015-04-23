function TetherLength = TetherLengthCalc(obj,SeaDepth)
TetherLength = abs(SeaDepth)-abs(obj.Length);