### `~/codelab/dotfiles/fortunes/README.md`

```markdown
# 🥠 Custom Fortunes for Terminal Fun

A curated collection of **custom `fortune` databases** for the classic Unix `fortune` program.  

These fortunes range from the Ferengi Rules of Acquisition to Rick & Morty one-liners — plus personal collections, prompts, and more. Perfect for your terminal MOTD, shell login, or just for random bits of wisdom (or nonsense).

---

## 🚀 Quick Start

```bash
git clone https://github.com/forfaxx/fortune-files.git
cd fortune-files
make           # Compile all .dat files
sudo make install   # Install to system fortune directory
```

After that, you can run: 

`fortune rules`
`fortune rickmorty`
etc. 

---

## 📁 Directory Structure

Each fortune database includes two files:

- `ferengi` — the plaintext file, with individual entries separated by a `%` symbol on a single line.
- `ferengi.dat` — the compiled binary index created by the `strfile` utility.

fortune-files/
├── Makefile
├── deep-thoughts      # Jack Handey quotes
├── grumble            # my personal collection
├── journal-prompts    # creative/writing prompts
├── oblique            # Oblique Strategies
├── rickmorty          # Rick & Morty quotes
└── rules              # Ferengi Rules of Acquisition

**Note:** .dat files are not checked into Git — they’re generated automatically by make.

---

## ✏️ Make Your Own Fortunes

Want to add your own quotes?  
Write a text file with each entry separated by `%`, run `strfile` to compile, and drop it into your fortune folder.

📖 See the full guide: [Fortune Favors the Sysadmin](https://adminjitsu.com/posts/fortune-favors-the-sysadmin)


## 🚀 Installing Custom Fortunes

To install system-wide (requires sudo):

```bash
sudo cp kevinisms kevinisms.dat /usr/share/games/fortunes/
```

Or use a **local directory** such as:

```bash
mkdir -p ~/.local/share/fortunes
cp kevinisms* ~/.local/share/fortunes/
```

To use them:

```bash
fortune ~/.local/share/fortunes/kevinisms
```

Optional: add to your shell profile:

```bash
export FORTUNE_PATH="$HOME/.local/share/fortunes"
```

---

## 🧠 `fortune` Command Line Options

| Option           | Description                                         |
| ---------------- | --------------------------------------------------- |
| `fortune`        | Pick a random quote from system databases.          |
| `fortune <file>` | Use a specific database file or folder.             |
| `-a`             | Include offensive fortunes (`off` category).        |
| `-s`             | Show only short fortunes (default max 160 chars).   |
| `-l`             | Show only long fortunes (over 160 chars).           |
| `-o`             | Show offensive fortunes only.                       |
| `-e`             | Equal probability of each file when using multiple. |
| `-f`             | List available fortune files and their weights.     |
| `-m <regex>`     | Search for fortunes matching a regex.               |
| `-n <length>`    | Set custom character limit for short fortunes.      |
| `-c`             | Display fortune with surrounding `%` separators.    |
| `-w`             | Wait for input (pause) before showing next.         |

### Examples

```bash
fortune -s                   # Short fortune
fortune ferengi -l           # Long quote from 'ferengi'
fortune -a -m chicken        # Search all fortunes for “chicken”
fortune -e ferengi darla     # Equal weight random between two
```

---

