function s = day2string(d)

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

% Input d must be an array of integers between 1 and 7.
if any(~isnumeric(d(:))) || ~all(ismember(d(:), 1:7))
    error('Input argument must be an array of integers between 1 and 7!')
end

% Call convert subroutine
s = cell(size(d));
for i=1:numel(d)
    s(i) = {convert(d(i))};
end
    
% Return a string if d is a scalar (a cell of strings if d is not a scalar).
if isequal(numel(d), 1)
    s = s{1};
end


function b = convert(a)
    switch a
      case 1
        b = 'Monday';
      case 2
        b = 'Tuesday';
      case 3
        b = 'Wednesday';
      case 4
        b = 'Thursday';
      case 5
        b = 'Friday';
      case 6
        b = 'Saturday';
      case 7
        b = 'Sunday';
      otherwise
        error('This case should not happen!')
    end