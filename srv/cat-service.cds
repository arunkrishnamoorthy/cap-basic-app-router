using my.bookshop as my from '../db/data-model';

@require: 'any'
service CatalogService {
    @readonly entity Books as projection on my.Books;
}