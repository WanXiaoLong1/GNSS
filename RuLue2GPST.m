function [WN,TOW]=RuLue2GPST(JD)
WN=floor((JD-2444244.5)/7)
TOW=rem(JD-2444244.5,7)*86400
end