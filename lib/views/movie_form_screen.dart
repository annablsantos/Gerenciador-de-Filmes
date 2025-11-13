import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import '../models/movie.dart';
import '../viewmodels/movie_viewmodel.dart';

class MovieFormScreen extends StatefulWidget {
  final Movie? movie;
  const MovieFormScreen({Key? key, this.movie}) : super(key: key);

  @override
  State<MovieFormScreen> createState() => _MovieFormScreenState();
}

class _MovieFormScreenState extends State<MovieFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final _urlController = TextEditingController();
  final _titleController = TextEditingController();
  final _genreController = TextEditingController();
  final _durationController = TextEditingController();
  final _yearController = TextEditingController();
  final _descController = TextEditingController();

  String? _selectedAge;
  double _rating = 0.0;

  final List<String> _ageOptions = ['Livre', '10', '12', '14', '16', '18'];

  @override
  void initState() {
    super.initState();
    if (widget.movie != null) {
      _urlController.text = widget.movie!.imageUrl;
      _titleController.text = widget.movie!.title;
      _genreController.text = widget.movie!.genre;
      _durationController.text = widget.movie!.duration;
      _yearController.text = widget.movie!.releaseYear.toString();
      _descController.text = widget.movie!.description;

      if (_ageOptions.contains(widget.movie!.ageRating)) {
        _selectedAge = widget.movie!.ageRating;
      } else {
        _selectedAge = 'Livre';
      }

      _rating = widget.movie!.rating;
    } else {
      _selectedAge = 'Livre';
    }
  }

  void _saveMovie() {
    if (_formKey.currentState!.validate()) {
      final movie = Movie(
        id: widget.movie?.id,
        title: _titleController.text,
        imageUrl: _urlController.text,
        genre: _genreController.text,
        ageRating: _selectedAge!,
        duration: _durationController.text,
        rating: _rating,
        description: _descController.text,
        releaseYear: int.tryParse(_yearController.text) ?? 0,
      );

      final viewModel = Provider.of<MovieViewModel>(context, listen: false);

      if (widget.movie == null) {
        viewModel.addMovie(movie);
      } else {
        viewModel.updateMovie(movie);
      }

      Navigator.pop(context);
    }
  }

  String? _validateRequired(String? value) {
    if (value == null || value.isEmpty) return 'Campo obrigatório';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar Filme"),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveMovie,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.save),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _urlController,
                decoration: const InputDecoration(labelText: 'Url Imagem'),
                validator: _validateRequired,
              ),
              const SizedBox(height: 10),

              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Título'),
                validator: _validateRequired,
              ),
              const SizedBox(height: 10),

              TextFormField(
                controller: _genreController,
                decoration: const InputDecoration(labelText: 'Gênero'),
                validator: _validateRequired,
              ),
              const SizedBox(height: 15),

              Row(
                children: [
                  const Text("Faixa Etária: ", style: TextStyle(fontSize: 16, color: Colors.black54)),
                  const SizedBox(width: 10),
                  DropdownButton<String>(
                    value: _selectedAge,
                    items: _ageOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedAge = newValue;
                      });
                    },
                  ),
                ],
              ),
              const Divider(color: Colors.black45),

              // 5. Duração
              TextFormField(
                controller: _durationController,
                decoration: const InputDecoration(labelText: 'Duração'),
                validator: _validateRequired,
              ),
              const SizedBox(height: 15),

              Row(
                children: [
                  const Text("Nota: ", style: TextStyle(fontSize: 16, color: Colors.black54)),
                  RatingBar.builder(
                    initialRating: _rating,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 35,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star_border,
                      color: Colors.blue,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        _rating = rating;
                      });
                    },
                    updateOnDrag: true,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                    unratedColor: Colors.grey[300],
                  ),
                ],
              ),
              const Divider(color: Colors.black45),

              TextFormField(
                controller: _yearController,
                decoration: const InputDecoration(labelText: 'Ano'),
                keyboardType: TextInputType.number,
                validator: _validateRequired,
              ),
              const SizedBox(height: 10),

              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(labelText: 'Descrição'),
                maxLines: 3,
                validator: _validateRequired,
              ),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}