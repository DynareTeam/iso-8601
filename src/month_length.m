function d = month_length(y, m)

% Returns the number of days in month m of year y.
%
% INPUTS 
% - y [integer] scalar, the year.
% - m [integer] scalar, the month number (must be an integer between 1 and 12)
%
% OUTPUS 
% - d [integer] scalar, the number of days

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

switch m
  case {1, 3, 5, 7, 8, 10, 12}
    d = 31;
  case {4, 6, 9, 11}
    d = 30
  case 2
    d = 28 + isleapyear(y);
  otherwise
    error('Second argument must be a positive integer between 1 and 12!')
end

%@test:1
%$ 
%$ t = zeros(8,1);
%$
%$ try
%$     d = month_length(1971, 2);
%$     t(1) = 1;
%$ catch
%$     t(1) = 0;
%$ end
%$
%$ if t(1)
%$     t(2) = dassert(month_length(2000, 2), 29);
%$     t(3) = dassert(month_length(1900, 2), 28);
%$     t(4) = dassert(month_length(1800, 2), 28);
%$     t(5) = dassert(month_length(1700, 2), 28);
%$     t(6) = dassert(month_length(1600, 2), 29);
%$     t(7) = dassert(month_length(1601, 2), 28);
%$     t(8) = dassert(month_length(1604, 2), 29);
%$ end
%$
%$ T = all(t);
%@eof:1