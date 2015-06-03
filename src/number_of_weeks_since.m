function nw = number_of_weeks_since(y1,w1,y0,w0)

% Returns the number of weeks between year y1 week number w1 and
% year y0 week number w0.
%
% INPUTS 
% - y1  [integer] year
% - w1  [integer] week
% - y0  [integer] year
% - w0  [integer] week
%
% OUTPUTS 
% - nw  [integers] number of weeks between [y1,w1] and [y0,w0].
%
% NOTES 
% - y0 and w0 are optional, default value is epoch time (1970W1).
% - If [y1,w1]<[y0,w0] a negative result is returned.

% Copyright (C) 2015 Dynare Team
%
% The iso8601 package is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% Dynare iso8601 submodule is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with Dynare.  If not, see <http://www.gnu.org/licenses/>.

if nargin<3
    % Epoch time
    y0 = 1970;
    w0 = 1;
end

% Test if w1 exists in year y1
if w1<1 || w1>number_of_weeks_in(y1)
    error('Week %s does not exist in %s!',int2str(w1), int2str(y1))
end

% Test if w0 exists in year y0
if w0<1 || w0>number_of_weeks_in(y0)
    error('Week %s does not exist in %s!',int2str(w0), int2str(y0))
end

if isequal(y1, y0)
    if isequal(w1,w0)
        nw = 1;
    elseif w1>w0
        nw  = w1-w0+1;
    else
        nw = -(abs(w0-w1)+1);
    end
elseif y1>y0
    nw = (number_of_weeks_in(y0)-w0+1)+sum(number_of_weeks_in(y0+1:y1-1))+w1;
else
    nw = -((number_of_weeks_in(y1)-w1+1)+sum(number_of_weeks_in(y1+1:y0-1))+w0);
end

%@test:1
%$ 
%$ t = zeros(9,1);
%$
%$ t(1) = dassert(number_of_weeks_since(1970,2),2);
%$ t(2) = dassert(number_of_weeks_since(1970,53),53);
%$ try
%$      number_of_weeks_since(1971,53);
%$      t(3) = 0;
%$ catch
%$      t(3) = 1;
%$ end
%$ t(4) = dassert(number_of_weeks_since(1972,2),107);
%$ t(5) = dassert(number_of_weeks_since(1972,2,1970,3),105);
%$ t(6) = dassert(number_of_weeks_since(1969,52),-2);
%$ t(7) = dassert(number_of_weeks_since(1969,1),-53);
%$ t(8) = dassert(number_of_weeks_since(1968,1),-105);
%$ t(9) = dassert(number_of_weeks_since(1968,3),-103);
%$ T = all(t);
%@eof:1