
		            <th>Delete</th>
						 <td>
						 	<form action="/books/${book.id}/delete" method="post">
							    <input type="hidden" name="_method" value="delete">
							    <input class="deleteBtn" type="submit" value="Delete">
							</form>
						</td>