#include <cmath>
#include <cstdlib>
#include <cstring>
#include <cstdio>
#include <algorithm>
#include <iomanip>
#include <iostream>
#include <string>
#include <map>
#include <vector>
#include <set>
#include <queue>

using namespace std;

#define fileIO(x, y) { freopen(x, "r", stdin); freopen(y, "w", stdout); }
#define rep(i,a,b) for(int i = int(a); i < int(b); ++i)
#define trav(it, v) for(__typeof((v).begin()) it = (v).begin(); it != (v).end(); ++it)

typedef vector<int> vi;
typedef vector<vector<int> > vvi;
typedef pair<int,int> pii;
typedef vector<pair<int,int> > vpi;
typedef vector<vector<pair<int,int> > > vvpi;
typedef map<int, int> mii;
typedef map<int, string> mis;
typedef map<string, int> msi;
typedef long long ll;

int seg[(1<<19) + 1], n, m;

void update(int w, bool par){
	if(!w) return;
	if(w < (1<<n)){
		if(par) seg[w] = seg[2*w + 1] ^ seg[2*w];
		else seg[w] = seg[2*w + 1] | seg[2*w];
	}
	update(w/2, !par);
}

bool solve(int tc){
	cin >> n >> m;
	for(int i = 0; i < (1<<n); ++i) cin >> seg[i + (1<<n)];
	for(int i = 0; i < (1<<n); ++i) update(i + (1<<n), true);
	rep(i,0,m){
		int p, b;
		cin >> p >> b;
		seg[p-1 + (1<<n)] = b;
		update(p-1 + (1 << n), true);
		cout << seg[1] << endl;
	}
	return false;
}

int main(){
	int n = 1 << 30;
	if(!n) scanf("%d", &n);
	for(int i = 0; i < n && solve(i); ++i);
}