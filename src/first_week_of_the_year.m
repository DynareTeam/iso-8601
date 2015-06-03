function [y, m, d] = first_week_of_the_year(y)

% Returns the month and day numbers of the first week of the year.
%
% INPUTS 
% - y [integer] the year.
%
% OUTPUS 
% - y [integer] the year of the first iso-8601 week of year y (may be equal to y-1)
% - m [integer] the month number (1 or 12)
% - d [integer] the day of the week (1, 2, ..., 7).

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

d = first_day_of_the_year(y);

switch d
  case 1 % Monday
    m = 1;
    d = 1;
  case {2,3,4} % Tuesday, Wednesday or Thursday
    y = y-1;
    m = 12;
    d = 33-d;
  case {5, 6, 7} % Friday, Saturday or Sunday
    m = 1;
    d = 9-d;
  otherwise
    error('This is most likely a bug!')
end

%@test:1
%$ 
%$ t = zeros(4,1);
%$
%$ try
%$     [y, m, d] = first_week_of_the_year(1971);
%$     t(1) = 1;
%$ catch
%$     t(1) = 0;
%$ end
%$
%$ if t(1)
%$     t(2) = dassert([y, m d], [1971 1 4]);
%$     [y, m, d] = first_week_of_the_year(1973);
%$     t(3) = dassert([y, m d], [1973 1 1]);
%$     [y, m, d] = first_week_of_the_year(1975);
%$     t(4) = dassert([y, m d], [1974 12 30]);
%$ end
%$
%$ T = all(t);
%@eof:1